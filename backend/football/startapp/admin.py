from django.contrib import admin
from .models import *


class AdminArticles(admin.ModelAdmin):
    list_display = ('id', 'title', 'date', 'text', 'author', 'cat')


class AdminUsers(admin.ModelAdmin):
    list_display = ('id', 'username', 'email')


class AdminRelation(admin.ModelAdmin):
    list_display = ('id', 'user', 'article', 'bookmarks')


class AdminCategory(admin.ModelAdmin):
    list_display = ('id', 'title', 'link')


class AdminLikes(admin.ModelAdmin):
    list_display = ('id', 'user', 'article', 'likes')


class AdminSub(admin.ModelAdmin):
    list_display = ('id', 'user', 'subscription', 'add')


class AdminComment(admin.ModelAdmin):
    list_display = ('id', 'user', 'article')


class AdminRate(admin.ModelAdmin):
    list_display = ('id', 'user', 'comment', 'rate')


class AdminBlackListJWT(admin.ModelAdmin):
    list_display = ('id', 'user', 'token')


class AdminPlayers(admin.ModelAdmin):
    list_display = ('id', 'first_name', 'last_name', 'club')


class AdminClub(admin.ModelAdmin):
    list_display = ('id', 'title')


class AdminYears(admin.ModelAdmin):
    list_display = ('id', 'year')


class AdminPosition(admin.ModelAdmin):
    list_display = ('id', 'position_player')


class AdminSituation(admin.ModelAdmin):
    list_display = ('id', 'situation_game')


class AdminZones(admin.ModelAdmin):
    list_display = ('id', 'zone')


class AdminTypes(admin.ModelAdmin):
    list_display = ('id', 'type')


class AdminTotalStatistics(admin.ModelAdmin):
    list_display = ('id', 'player', 'year', 'club')


class AdminPositionStatistics(admin.ModelAdmin):
    list_display = ('id', 'player', 'position')


class AdminSituationStatistics(admin.ModelAdmin):
    list_display = ('id', 'player', 'situation')


class AdminShotZonesStatistics(admin.ModelAdmin):
    list_display = ('id', 'player', 'shot_zones')


class AdminShotTypesStatistics(admin.ModelAdmin):
    list_display = ('id', 'player', 'shot_types')


class AdminPositionChampionship(admin.ModelAdmin):
    list_display = ('id', 'club', 'year')


class AdminMatches(admin.ModelAdmin):
    list_display = ('id', 'home_team', 'guest_team')


class AdminMatchesStats(admin.ModelAdmin):
    list_display = ('id',)


class AdminMatchesPlayersStats(admin.ModelAdmin):
    list_display = ('id', 'match', 'player')


admin.site.register(Articles, AdminArticles)
admin.site.register(Users, AdminUsers)
admin.site.register(ArticlesRelation, AdminRelation)
admin.site.register(CategoryArticles, AdminCategory)
admin.site.register(ArticlesLikes, AdminLikes)
admin.site.register(UsersSub, AdminSub)
admin.site.register(CommentArticle, AdminComment)
admin.site.register(RateComment, AdminRate)
admin.site.register(BlackListJWT, AdminBlackListJWT)
admin.site.register(Players, AdminPlayers)
admin.site.register(Club, AdminClub)
admin.site.register(Years, AdminYears)
admin.site.register(Position, AdminPosition)
admin.site.register(Situation, AdminSituation)
admin.site.register(ShotZones, AdminZones)
admin.site.register(ShotTypes, AdminTypes)
admin.site.register(TotalStatistics, AdminTotalStatistics)
admin.site.register(PositionStatistics, AdminPositionStatistics)
admin.site.register(SituationStatistics, AdminSituationStatistics)
admin.site.register(ShotZonesStatistics, AdminShotZonesStatistics)
admin.site.register(ShotTypesStatistics, AdminShotTypesStatistics)
admin.site.register(PositionChampionship, AdminPositionChampionship)
admin.site.register(Matches, AdminMatches)
admin.site.register(MatchesStats, AdminMatchesStats)
admin.site.register(MatchesPlayersStats, AdminMatchesPlayersStats)

# Register your models here.
