from django.core.exceptions import ValidationError
from django.utils.deconstruct import deconstructible
from django.utils.translation import gettext_lazy as _


@deconstructible
class FileSizeValidator:
    """
    Validates file size in bytes
    """

    message = _(
        'File size must be less than “%(size)s” kb. '
    )
    code = 'file-size'

    def __init__(self, size=None, message=None, code=None):
        if size is not None:
            size = size
        self.size = size
        if message is not None:
            self.message = message
        if code is not None:
            self.code = code

    def __call__(self, value):

        if value.size > self.size:
            raise ValidationError(
                self.message,
                code=self.code,
                params={
                    'size': self.size / 1024,
                    'value': value,
                }
            )

    def __eq__(self, other):
        return (
            isinstance(other, self.__class__) and
            self.allowed_extensions == other.allowed_extensions and
            self.message == other.message and
            self.code == other.code
        )
