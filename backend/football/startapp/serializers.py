from itertools import chain
import datetime
from django.db.models import Count
from rest_framework import serializers
from .models import *
import re


class MeSerializer(serializers.ModelSerializer):
    my_articles = serializers.SerializerMethodField()
    bookmarks = serializers.SerializerMethodField()
    sub_user = serializers.SerializerMethodField()
    like_count = serializers.SerializerMethodField()
    followers_count = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ('image', 'first_name', 'last_name', 'email', 'bookmarks', 'my_articles', 'username', 'sub_user', 'like_count', 'followers_count')

    def get_my_articles(self, instance):
        return Articles.objects.filter(author=instance.id).values_list('id', flat=True)

    def get_bookmarks(self, instance):
        return ArticlesRelation.objects.filter(user=instance, bookmarks=True).values_list('article', flat=True)

    def get_sub_user(self, instance):
        sub1 = UsersSub.objects.filter(subscription=instance, add=True).values_list('user', flat=True)
        sub2 = UsersSub.objects.filter(user=instance, add=True).values_list('subscription', flat=True)
        users = list(chain(sub1, sub2))
        sub_all = Users.objects.filter(pk__in=users).values('first_name', 'last_name', 'username', 'image')
        return sub_all

    def get_like_count(self, instance):
        list_art = Articles.objects.filter(author=instance).values_list(flat=True)
        return ArticlesLikes.objects.filter(article_id__in=list(list_art), likes=True).count()

    def get_followers_count(self, instance):
        return UsersSub.objects.filter(subscription=instance, add=False).count()


class UserSerializer(serializers.ModelSerializer):
    my_articles = serializers.SerializerMethodField()
    sub_user = serializers.SerializerMethodField()
    subscriber_user = serializers.SerializerMethodField()
    choice_user = serializers.SerializerMethodField()
    like_count = serializers.SerializerMethodField()
    followers_count = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ('image', 'first_name', 'last_name', 'my_articles', 'username', 'sub_user', 'subscriber_user', 'id', 'choice_user', 'like_count', 'followers_count')

    def get_my_articles(self, instance):
        return Articles.objects.filter(author=instance.id).values_list('id', flat=True)

    def get_sub_user(self, instance):
        sub1 = UsersSub.objects.filter(subscription=instance, add=True).values_list('user', flat=True)
        sub2 = UsersSub.objects.filter(user=instance, add=True).values_list('subscription', flat=True)
        users = list(chain(sub1, sub2))
        sub_all = Users.objects.filter(pk__in=users).values('first_name', 'last_name', 'username', 'image')
        return sub_all

    def get_subscriber_user(self, instance):
        try:
            sub1 = UsersSub.objects.filter(user=self.context['request'].user, subscription=instance, add=False).values_list(flat=True)
            sub2 = UsersSub.objects.filter(user=instance, subscription=self.context['request'].user, add=False).values_list(flat=True)
            subscription = list(chain(sub1, sub2))
            return bool(subscription)
        except:
            return False

    def get_choice_user(self, instance):
        try:
            sub = UsersSub.objects.filter(user=instance, subscription=self.context['request'].user, add=False).values_list(flat=True)
            return bool(sub)
        except:
            return False

    def get_like_count(self, instance):
        list_art = Articles.objects.filter(author=instance).values_list(flat=True)
        return ArticlesLikes.objects.filter(article_id__in=list(list_art), likes=True).count()

    def get_followers_count(self, instance):
        return UsersSub.objects.filter(subscription=instance, add=False).count()


class ArticleSerializer(serializers.ModelSerializer):
    author = serializers.SerializerMethodField()
    count_true = serializers.SerializerMethodField()
    count_false = serializers.SerializerMethodField()
    like_dislike = serializers.SerializerMethodField()
    comment = serializers.SerializerMethodField()
    date = serializers.SerializerMethodField()

    class Meta:
        model = Articles
        fields = ('title', 'text', 'date', 'cat', 'like_dislike', 'count_true', 'count_false', 'author', 'id', 'comment')

    def get_date(self, instance):
        d1 = datetime.datetime.now(datetime.timezone.utc)
        d2 = instance.date
        adding_time = str(d1 - d2)
        match = re.findall(r'\b[0-9]{1,3}\b', adding_time)
        m_list = list(map(int, match))
        result = ''
        if len(m_list) > 3:
            result = f'{m_list[0] // 30} {"months" if (m_list[0] // 30) > 1 else "month"} ago'
            if (m_list[0] // 30) == 0:
                result = f'{m_list[0]} {"days" if m_list[0] > 1 else "day"} ago'
        else:
            if m_list[0] != 0:
                result = f'{m_list[0]} {"hours" if m_list[0] > 1 else "hour"} ago'
            elif m_list[1] != 0:
                result = f'{m_list[1]} {"minutes" if m_list[1] > 1 else "minute"} ago'
            else:
                result = f'{m_list[2]} {"seconds" if m_list[2] > 1 else "second"} ago'
        return result

    def get_comment(self, instance):
        return CommentArticle.objects.filter(article=instance).values_list(flat=True)

    def get_author(self, instance):
        return instance.author.username

    def get_count_true(self, instance):
        return ArticlesLikes.objects.filter(article=instance, likes=True).count()

    def get_count_false(self, instance):
        return ArticlesLikes.objects.filter(article=instance, likes=False).count()

    def get_like_dislike(self, instance):
        result = {'like': 0, 'dislike': 0}
        try:
            like_or_dislike = ArticlesLikes.objects.get(article=instance, user=self.context['request'].user)

            if like_or_dislike.likes == True:
                result['like'] = 1
                return result
            elif like_or_dislike.likes == False:
                result['dislike'] = 1
                return result
            else:
                return result

        except:
            return result


class CreateArticleSerializer(serializers.ModelSerializer):
    author = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = Articles
        fields = ('title', 'text', 'date', 'cat', 'author')


class ArticlesRelationSerializer(serializers.ModelSerializer):
    class Meta:
        model = ArticlesRelation
        fields = '__all__'


class ArticlesCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = CategoryArticles
        fields = '__all__'


class ArticlesLikesSerializer(serializers.ModelSerializer):
    class Meta:
        model = ArticlesLikes
        fields = '__all__'


class UsersSubSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsersSub
        fields = '__all__'


class CommentArticleSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    rate_user = serializers.SerializerMethodField()
    rate_count = serializers.SerializerMethodField()
    reply_second = serializers.SerializerMethodField()
    date = serializers.SerializerMethodField()

    class Meta:
        model = CommentArticle
        fields = ('user', 'content', 'date', 'id', 'rate_user', 'rate_count', 'reply_first', 'reply_second')

    def get_date(self, instance):
        d1 = datetime.datetime.now(datetime.timezone.utc)
        d2 = instance.date
        adding_time = str(d1 - d2)
        match = re.findall(r'\b[0-9]{1,3}\b', adding_time)
        m_list = list(map(int, match))
        result = ''
        if len(m_list) > 3:
            result = f'{m_list[0] // 30} {"months" if (m_list[0] // 30) > 1 else "month"} ago'
            if (m_list[0] // 30) == 0:
                result = f'{m_list[0]} {"days" if m_list[0] > 1 else "day"} ago'
        else:
            if m_list[0] != 0:
                result = f'{m_list[0]} {"hours" if m_list[0] > 1 else "hour"} ago'
            elif m_list[1] != 0:
                result = f'{m_list[1]} {"minutes" if m_list[1] > 1 else "minute"} ago'
            else:
                result = f'{m_list[2]} {"seconds" if m_list[2] > 1 else "second"} ago'
        return result

    def get_user(self, instance):
        return instance.user.username

    def get_reply_second(self, instance):
        if instance.reply_second != None:
            return instance.reply_second.user.username
        return instance.reply_second

    def get_rate_user(self, instance):
        result = False
        try:
            user = Users.objects.get(username=self.context['request'].user).id
            rate_true = RateComment.objects.filter(comment=instance, rate=True).values_list('user', flat=True)
            rate_false = RateComment.objects.filter(comment=instance, rate=False).values_list('user', flat=True)
            rate = list(chain(rate_true, rate_false))
            if user in rate:
                if user in rate_true:
                    result = 1
                    return result
                result = -1
                return result
            return result
        except:
            return result

    def get_rate_count(self, instance):
        rate_true = RateComment.objects.filter(comment=instance, rate=True).count()
        rate_false = RateComment.objects.filter(comment=instance, rate=False).count()
        return rate_true - rate_false


class CreateCommentArticleSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = CommentArticle
        fields = ('user', 'content', 'date', 'rate', 'reply_first', 'reply_second')

    def create(self, validated_data):
        try:
            if len(self.context['reply']) == 1:
                validated_data['reply_first'] = CommentArticle.objects.get(pk=self.context['reply'][0])
            else:
                validated_data['reply_first'] = CommentArticle.objects.get(pk=self.context['reply'][0])
                validated_data['reply_second'] = CommentArticle.objects.get(pk=self.context['reply'][1])
        except:
            pass
        validated_data['article'] = Articles.objects.get(pk=int(self.context['article']))
        return CommentArticle.objects.create(**validated_data)


class RateCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = RateComment
        fields = '__all__'


class BlackListJWTSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = BlackListJWT
        fields = "__all__"


class PlayersLineUpSerializer(serializers.ModelSerializer):
    position = serializers.SerializerMethodField()
    age = serializers.SerializerMethodField()
    games = serializers.SerializerMethodField()

    class Meta:
        model = Players
        fields = (
                'id',
                'position',
                'number',
                'first_name',
                'last_name',
                'age',
                'games',
                )

    def get_age(self, instance):
        query = datetime.date.today().year - instance.date.year \
            if datetime.date.today().month - instance.date.month \
            else datetime.date.today().year - instance.date.year - 1

        return query

    def get_position(self, instance):
        query = {
            'id': instance.main_position.id,
            'position': instance.main_position.position_player
        }
        return query

    def get_games(self, instance):
        return TotalStatistics.objects.get(player=instance.id).apps


class PlayerSerializerRetrieve(serializers.ModelSerializer):
    club = serializers.SerializerMethodField()
    position = serializers.SerializerMethodField()
    total = serializers.SerializerMethodField()
    positions = serializers.SerializerMethodField()
    situations = serializers.SerializerMethodField()
    shot_zones = serializers.SerializerMethodField()
    shot_types = serializers.SerializerMethodField()


    class Meta:
        model = Players
        fields = (
            'position',
            'number',
            'image',
            'country',
            'city',
            'first_name',
            'last_name',
            'date',
            'club',
            'total',
            'positions',
            'situations',
            'shot_zones',
            'shot_types',
        )

    def get_position(self, instance):
        return instance.main_position.position_player

    def get_club(self, instance):
        return instance.club.title

    def get_total(self, instance):
        query = TotalStatistics.objects.filter(player=instance.id)
        serializer = TotalStatisticsSerializer(query, many=True)
        return serializer.data

    def get_positions(self, instance):
        query = PositionStatistics.objects.filter(player=instance.id)
        serializer = PositionStatisticsSerializer(query, many=True)
        return serializer.data

    def get_situations(self, instance):
        query = SituationStatistics.objects.filter(player=instance.id)
        serializer = SituationStatisticsSerializer(query, many=True)
        return serializer.data

    def get_shot_zones(self, instance):
        query = ShotZonesStatistics.objects.filter(player=instance.id)
        serializer = ShotZonesStatisticsSerializer(query, many=True)
        return serializer.data

    def get_shot_types(self, instance):
        query = ShotTypesStatistics.objects.filter(player=instance.id)
        serializer = ShotTypesStatisticsSerializer(query, many=True)
        return serializer.data


class ClubSerializerList(serializers.ModelSerializer):
    position = serializers.SerializerMethodField()

    class Meta:
        model = Club
        fields = ('title', 'image', 'position')

    def get_position(self, instance):
        return PositionChampionship.objects.get(club=instance.id, year=self.context['year']).position_team


class ClubSerializerRetrieve(serializers.ModelSerializer):
    class Meta:
        model = Club
        fields = ('title', 'year_creation', 'image', 'city', 'arena', 'cup', 'manager')


class TotalStatisticsSerializer(serializers.ModelSerializer):
    year = serializers.SerializerMethodField()
    club = serializers.SerializerMethodField()

    class Meta:
        model = TotalStatistics
        fields = (
            'year',
            'club',
            'apps',
            'min',
            'goal',
            'assist',
            'sh_90',
            'kp_90',
            'xg',
            'xa',
            'xg_90',
            'xa_90',
        )

    def get_year(self, instance):
        return instance.year.year

    def get_club(self, instance):
        return instance.club.title


class PositionStatisticsSerializer(serializers.ModelSerializer):
    position = serializers.SerializerMethodField()

    class Meta:
        model = PositionStatistics
        fields = (
            'position',
            'apps',
            'min',
            'goal',
            'assist',
            'sh_90',
            'kp_90',
            'xg',
            'xa',
            'xg_90',
            'xa_90',
        )

    def get_position(self, instance):
        return instance.position.position_player


class SituationStatisticsSerializer(serializers.ModelSerializer):
    situation = serializers.SerializerMethodField()

    class Meta:
        model = SituationStatistics
        fields = (
            'situation',
            'sh',
            'goal',
            'kp',
            'assist',
            'xg',
            'xa',
            'xg_90',
            'xa_90',
            'xg_sh',
            'xa_kp',
        )

    def get_situation(self, instance):
        return instance.situation.situation_game


class ShotZonesStatisticsSerializer(serializers.ModelSerializer):
    shot_zones = serializers.SerializerMethodField()

    class Meta:
        model = ShotZonesStatistics
        fields = (
            'shot_zones',
            'sh',
            'goal',
            'kp',
            'assist',
            'xg',
            'xa',
            'xg_sh',
            'xa_kp',
        )

    def get_shot_zones(self, instance):
        return instance.shot_zones.zone


class ShotTypesStatisticsSerializer(serializers.ModelSerializer):
    shot_types = serializers.SerializerMethodField()

    class Meta:
        model = ShotTypesStatistics
        fields = (
            'shot_types',
            'sh',
            'goal',
            'kp',
            'assist',
            'xg',
            'xa',
            'xg_sh',
            'xa_kp',
        )

    def get_shot_types(self, instance):
        return instance.shot_types.type


class MatchesSerializer(serializers.ModelSerializer):
    home_team = serializers.SerializerMethodField()
    guest_team = serializers.SerializerMethodField()

    class Meta:
        model = Matches
        fields = (
            'id',
            'amount_goals_home_team',
            'amount_goals_guest_team',
            'date_game', 'home_team',
            'guest_team',
            'year',
        )

    def get_home_team(self, instance):
        return instance.home_team.title

    def get_guest_team(self, instance):
        return instance.guest_team.title


class MatchSerializer(serializers.ModelSerializer):
    home_team = serializers.SerializerMethodField()
    guest_team = serializers.SerializerMethodField()
    total_stats = serializers.SerializerMethodField()
    players_stats = serializers.SerializerMethodField()
    home_image = serializers.SerializerMethodField()
    guest_image = serializers.SerializerMethodField()

    class Meta:
        model = Matches
        fields = (
            'amount_goals_home_team',
            'amount_goals_guest_team',
            'date_game', 'home_team',
            'guest_team',
            'year',
            'total_stats',
            'players_stats',
            'home_image',
            'guest_image',
        )

    def get_home_team(self, instance):
        return instance.home_team.title

    def get_guest_team(self, instance):
        return instance.guest_team.title

    def get_total_stats(self, instance):
        query = MatchesStats.objects.get(pk=instance.total_stats.id)
        serializer = MatchesStatsSerializer(query)
        return serializer.data.values()

    def get_players_stats(self, instance):
        query = MatchesPlayersStats.objects.filter(match=instance.id)
        serializer = MatchesPlayersStatsSerializer(query, many=True)
        return serializer.data

    def get_home_image(self, instance):
        query = Club.objects.get(pk=instance.home_team.id).image.url
        return f'http://127.0.0.1:8000{query}'

    def get_guest_image(self, instance):
        query = Club.objects.get(pk=instance.guest_team.id).image.url
        return f'http://127.0.0.1:8000{query}'


class MatchesStatsSerializer(serializers.ModelSerializer):
    stats = serializers.SerializerMethodField()

    class Meta:
        model = MatchesStats
        fields = ('stats',)

    def get_stats(self, instance):
        query = [
            {'name': 'chances', 'home': instance.home_chances, 'guest': instance.guest_chances},
            {'name': 'xg', 'home': instance.home_xg, 'guest': instance.guest_xg},
            {'name': 'shots', 'home': instance.home_shots, 'guest': instance.guest_shots},
            {'name': 'shots on target', 'home': instance.home_shots_on_target, 'guest': instance.guest_shots_on_target},
            {'name': 'deep', 'home': instance.home_deep, 'guest': instance.guest_deep},
            {'name': 'ppda', 'home': instance.home_ppda, 'guest': instance.guest_ppda},
            {'name': 'xpts', 'home': instance.home_xpts, 'guest': instance.guest_xpts},
        ]
        return query

    # def get_guest(self, instance):
    #     query = {
    #         'chances': instance.guest_chances,
    #         'xg': instance.guest_xg,
    #         'shots': instance.guest_shots,
    #         'shots_on_target': instance.guest_shots_on_target,
    #         'deep': instance.guest_deep,
    #         'ppda': instance.guest_ppda,
    #         'xpts': instance.guest_xpts,
    #     }
    #     return query

class MatchesPlayersStatsSerializer(serializers.ModelSerializer):
    player = serializers.SerializerMethodField()
    position = serializers.SerializerMethodField()

    class Meta:
        model = MatchesPlayersStats
        fields = ('player',
                  'position',
                  'min',
                  'sh',
                  'goal',
                  'kp',
                  'assist',
                  'xg',
                  'xa'
                  )

    def get_player(self, instance):
        return instance.player.last_name

    def get_position(self, instance):
        return instance.position.position_player
