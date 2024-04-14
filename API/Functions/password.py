import hashlib

def encode_password(password):
    salt = "gG7%pah"

    # Расчёт середины пароля и разбитие пароля на две части
    middle_index = len(password) // 2
    first_part = password[:middle_index]
    second_part = password[middle_index:]
    
    # Добавление соли в трёх частях
    modified_password = salt + first_part + salt + second_part + salt

    # Хеширование MD5
    md5_hash = hashlib.md5(modified_password.encode()).hexdigest()
    
    return md5_hash