from rest_framework import permissions


class VerifiedUser(permissions.BasePermission):
    """
    Custom permission to only allow verified users 
    """

    def has_object_permission(self, request, view, obj):
        return obj.verified
