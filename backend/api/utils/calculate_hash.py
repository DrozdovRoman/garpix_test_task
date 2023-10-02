import hashlib


def calculate_hash_string(input_string, hash_algorithm='sha256'):
    """
    Вычисляет хэш заданной строки.

    :param input_string: Входная строка, для которой нужно вычислить хэш.
    :param hash_algorithm: Алгоритм хэширования (по умолчанию 'sha256').
    :return: Хэш строки в виде шестнадцатеричной строки.
    """
    hash_object = hashlib.new(hash_algorithm)

    hash_object.update(input_string.encode('utf-8'))

    hash_result = hash_object.hexdigest()

    return hash_result
