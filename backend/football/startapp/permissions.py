from rest_framework import permissions


class IsUserOrReadOnly(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        print('1111111111')
        # if request.method in permissions.SAFE_METHODS:
        #     return True
        # return request.user == obj.user
        return False