from rest_framework import permissions


class VerifiedUser(permissions.BasePermission):
    """
    Custom permission to only allow verified users 
    """
    def has_permission(self, request, view):
        return request.user.profile.verified
