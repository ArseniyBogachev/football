from django.db import models
from django.contrib.auth.models import AbstractUser



# добавить поле age!!!!!!!!!!!!!!!!!
class Users(AbstractUser):
    first_name = models.CharField(max_length=10)
    last_name = models.CharField(max_length=10)
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=10, unique=True)
    image = models.ImageField(upload_to='image/users/%Y/%m/%d', null=True)
    bookmarks = models.ManyToManyField('Articles', through='ArticlesRelation', related_name='bookmarks')
    sub_user = models.ManyToManyField('Users', through='UsersSub', related_name='subscriptions')

    REQUIRED_FIELDS = ['image', 'first_name', 'last_name', 'email', 'bookmarks', 'sub_user', 'id']

    def __str__(self):
        return self.username


class Articles(models.Model):
    title = models.CharField(max_length=255)
    author = models.ForeignKey(Users, null=True, on_delete=models.SET_NULL)
    date = models.DateTimeField(auto_now_add=True)
    text = models.TextField()
    cat = models.ForeignKey('CategoryArticles', null=True, on_delete=models.SET_NULL)
    likes = models.ManyToManyField('Users', through='ArticlesLikes', related_name='likes')

    REQUIRED_FIELDS = ['title', 'author', 'date', 'text', 'cat', 'likes']

    def __str__(self):
        return self.title


class ArticlesRelation(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    article = models.ForeignKey(Articles, on_delete=models.CASCADE)
    bookmarks = models.BooleanField(default=False)

    def __str__(self):
        return f'user: {self.user} articles: {self.article} bookmarks: {self.bookmarks}'


class CategoryArticles(models.Model):
    title = models.CharField(max_length=255)
    link = models.CharField(max_length=255)
    image = models.ImageField(upload_to='image/category/%Y/%m/%d')

    def __str__(self):
        return self.title


class ArticlesLikes(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    article = models.ForeignKey(Articles, on_delete=models.CASCADE)
    likes = models.BooleanField(default=False)

    REQUIRED_FIELDS = ['article', 'likes']

    def __str__(self):
        return f'user: {self.user} articles: {self.article} likes: {self.likes}'


class UsersSub(models.Model):
    user = models.ForeignKey(Users, on_delete=models.SET_NULL, null=True, related_name='user')
    subscription = models.ForeignKey(Users, on_delete=models.SET_NULL, null=True, related_name='sub')
    add = models.BooleanField(default=False)


class CommentArticle(models.Model):
    user = models.ForeignKey(Users, null=True, on_delete=models.SET_NULL)
    article = models.ForeignKey(Articles, on_delete=models.CASCADE)
    content = models.TextField()
    reply_first = models.ForeignKey('CommentArticle', null=True, on_delete=models.SET_NULL, related_name='first')
    reply_second = models.ForeignKey('CommentArticle', null=True, on_delete=models.SET_NULL, related_name='second')
    date = models.DateTimeField(auto_now_add=True)
    rate = models.ManyToManyField(Users, through='RateComment', related_name='rate')

    # REQUIRED_FIELDS = ['user', 'article', 'content', 'date', 'rate']

    def __str__(self):
        return f'user: {self.user}'


class RateComment(models.Model):
    user = models.ForeignKey(Users, null=True, on_delete=models.SET_NULL)
    comment = models.ForeignKey(CommentArticle, on_delete=models.CASCADE)
    rate = models.BooleanField(default=False)


class BlackListJWT(models.Model):
    token = models.CharField(max_length=500)
    user = models.ForeignKey(Users, on_delete=models.CASCADE)


class Players(models.Model):
    first_name = models.CharField(max_length=15, blank=True)
    last_name = models.CharField(max_length=15)
    number = models.IntegerField()
    country = models.CharField(max_length=30)
    city = models.CharField(max_length=30)
    date = models.DateField(null=True)
    image = models.ImageField(upload_to='image/players/%Y/%m/%d', null=True)
    main_position = models.ForeignKey('Position', on_delete=models.PROTECT)
    club = models.ForeignKey('Club', on_delete=models.PROTECT)
    total_analysis = models.ManyToManyField('Years', through='TotalStatistics', related_name='total')
    position_analysis = models.ManyToManyField('Position', through='PositionStatistics', related_name='position')
    situation_analysis = models.ManyToManyField('Situation', through='SituationStatistics', related_name='situation')
    shot_zones_analysis = models.ManyToManyField('ShotZones', through='ShotZonesStatistics', related_name='shotZones')
    shot_types_analysis = models.ManyToManyField('ShotTypes', through='ShotTypesStatistics', related_name='shotTypes')

    def __str__(self):
        return f'{self.first_name}, {self.last_name}'


# добавить years, content и players_star
class Club(models.Model):
    title = models.CharField(max_length=20)
    year_creation = models.IntegerField()
    image = models.FileField(upload_to='image/teams/%Y/%m/%d', null=True)
    city = models.CharField(max_length=30)
    arena = models.CharField(max_length=30)
    cup = models.CharField(max_length=255, default="no cups", blank=True)
    manager = models.CharField(max_length=30)
    position_championship = models.ManyToManyField('Years', through='PositionChampionship', related_name='position')

    def __str__(self):
        return self.title


class Years(models.Model):
    year = models.CharField(max_length=10)

    def __str__(self):
        return self.year


class Position(models.Model):
    position_player = models.CharField(max_length=30)

    def __str__(self):
        return self.position_player


class Situation(models.Model):
    situation_game = models.CharField(max_length=30)

    def __str__(self):
        return self.situation_game


class ShotZones(models.Model):
    zone = models.CharField(max_length=30)

    def __str__(self):
        return self.zone


class ShotTypes(models.Model):
    type = models.CharField(max_length=30)

    def __str__(self):
        return self.type


class TotalStatistics(models.Model):
    player = models.ForeignKey(Players, on_delete=models.PROTECT)
    year = models.ForeignKey(Years, on_delete=models.PROTECT)
    club = models.ForeignKey(Club, on_delete=models.PROTECT)
    apps = models.IntegerField()
    min = models.IntegerField()
    goal = models.IntegerField()
    assist = models.IntegerField()
    sh_90 = models.DecimalField(max_digits=4, decimal_places=2)
    kp_90 = models.DecimalField(max_digits=4, decimal_places=2)
    xg = models.DecimalField(max_digits=4, decimal_places=2)
    xa = models.DecimalField(max_digits=4, decimal_places=2)
    xg_90 = models.DecimalField(max_digits=4, decimal_places=2)
    xa_90 = models.DecimalField(max_digits=4, decimal_places=2)


class PositionStatistics(models.Model):
    player = models.ForeignKey(Players, on_delete=models.PROTECT)
    position = models.ForeignKey(Position, on_delete=models.PROTECT)
    apps = models.IntegerField()
    min = models.IntegerField()
    goal = models.IntegerField()
    assist = models.IntegerField()
    sh_90 = models.DecimalField(max_digits=4, decimal_places=2)
    kp_90 = models.DecimalField(max_digits=4, decimal_places=2)
    xg = models.DecimalField(max_digits=4, decimal_places=2)
    xa = models.DecimalField(max_digits=4, decimal_places=2)
    xg_90 = models.DecimalField(max_digits=4, decimal_places=2)
    xa_90 = models.DecimalField(max_digits=4, decimal_places=2)


class SituationStatistics(models.Model):
    player = models.ForeignKey(Players, on_delete=models.PROTECT)
    situation = models.ForeignKey(Situation, on_delete=models.PROTECT)
    sh = models.IntegerField()
    goal = models.IntegerField()
    kp = models.IntegerField()
    assist = models.IntegerField()
    xg = models.DecimalField(max_digits=4, decimal_places=2)
    xa = models.DecimalField(max_digits=4, decimal_places=2)
    xg_90 = models.DecimalField(max_digits=4, decimal_places=2)
    xa_90 = models.DecimalField(max_digits=4, decimal_places=2)
    xg_sh = models.DecimalField(max_digits=4, decimal_places=2)
    xa_kp = models.DecimalField(max_digits=4, decimal_places=2)


class ShotZonesStatistics(models.Model):
    player = models.ForeignKey(Players, on_delete=models.PROTECT)
    shot_zones = models.ForeignKey(ShotZones, on_delete=models.PROTECT)
    sh = models.IntegerField()
    goal = models.IntegerField()
    kp = models.IntegerField()
    assist = models.IntegerField()
    xg = models.DecimalField(max_digits=4, decimal_places=2)
    xa = models.DecimalField(max_digits=4, decimal_places=2)
    xg_sh = models.DecimalField(max_digits=4, decimal_places=2)
    xa_kp = models.DecimalField(max_digits=4, decimal_places=2)


class ShotTypesStatistics(models.Model):
    player = models.ForeignKey(Players, on_delete=models.PROTECT)
    shot_types = models.ForeignKey(ShotTypes, on_delete=models.PROTECT)
    sh = models.IntegerField()
    goal = models.IntegerField()
    kp = models.IntegerField()
    assist = models.IntegerField()
    xg = models.DecimalField(max_digits=4, decimal_places=2)
    xa = models.DecimalField(max_digits=4, decimal_places=2)
    xg_sh = models.DecimalField(max_digits=4, decimal_places=2)
    xa_kp = models.DecimalField(max_digits=4, decimal_places=2)


class PositionChampionship(models.Model):
    club = models.ForeignKey(Club, on_delete=models.PROTECT)
    year = models.ForeignKey(Years, on_delete=models.PROTECT)
    position_team = models.IntegerField()


class Matches(models.Model):
    home_team = models.ForeignKey(Club, on_delete=models.CASCADE, related_name='home')
    guest_team = models.ForeignKey(Club, on_delete=models.CASCADE, related_name='guest')
    amount_goals_home_team = models.IntegerField()
    amount_goals_guest_team = models.IntegerField()
    date_game = models.DateField()
    year = models.ForeignKey(Years, on_delete=models.CASCADE, null=True)
    total_stats = models.ForeignKey('MatchesStats', on_delete=models.PROTECT, null=True)
    players_stats = models.ManyToManyField(Players, through='MatchesPlayersStats', related_name='players')


class MatchesStats(models.Model):
    home_chances = models.IntegerField()
    home_xg = models.DecimalField(max_digits=4, decimal_places=2)
    home_shots = models.IntegerField()
    home_shots_on_target = models.IntegerField()
    home_deep = models.IntegerField()
    home_ppda = models.DecimalField(max_digits=4, decimal_places=2)
    home_xpts = models.DecimalField(max_digits=4, decimal_places=2)

    guest_chances = models.IntegerField()
    guest_xg = models.DecimalField(max_digits=4, decimal_places=2)
    guest_shots = models.IntegerField()
    guest_shots_on_target = models.IntegerField()
    guest_deep = models.IntegerField()
    guest_ppda = models.DecimalField(max_digits=4, decimal_places=2)
    guest_xpts = models.DecimalField(max_digits=4, decimal_places=2)


class MatchesPlayersStats(models.Model):
    match = models.ForeignKey(Matches, on_delete=models.CASCADE)
    player = models.ForeignKey(Players, on_delete=models.CASCADE)
    position = models.ForeignKey(Position, on_delete=models.PROTECT)
    min = models.IntegerField()
    sh = models.IntegerField()
    goal = models.IntegerField()
    kp = models.IntegerField()
    assist = models.IntegerField()
    xg = models.DecimalField(max_digits=4, decimal_places=2)
    xa = models.DecimalField(max_digits=4, decimal_places=2)

