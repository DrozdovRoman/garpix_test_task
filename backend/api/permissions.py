from rest_framework.permissions import SAFE_METHODS, BasePermission

ALLOWED_METHODS = ('DELETE', 'PATCH', 'POST', 'PUT')


class IsOwnerOrReadOnly(BasePermission):
    """
    Permission to GET object and GET list of objects:
      * For anonymous user
      * For authenticated user

    Permission to POST, DELETE, PATCH object:
      * For author
    """
    def has_object_permission(self, request, view, obj):
        return request.method in SAFE_METHODS or obj.author == request.user

    def has_permission(self, request, view):
        method = request.method
        is_auth = request.user.is_authenticated

        return method in SAFE_METHODS or method in ALLOWED_METHODS and is_auth
