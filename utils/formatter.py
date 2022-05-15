import sys


# Скрипт, который выносит лейблы в левую часть строки. 
# Для полноценного форматировани нужно парсить фортран, а так уже читается лучше.
# Использование: python formatter.py <input_path> <output_path>


def format_line(line):
    stripped_line = line.strip()
    label_end_index = 0
    while label_end_index < len(stripped_line) and stripped_line[label_end_index].isdigit():
        label_end_index += 1
    label = stripped_line[:label_end_index]
    code_line = stripped_line[label_end_index:].lstrip()
    return f'{label:>5} {code_line}\n'


def format_file(src_path, tgt_path):
    with open(src_path) as src_file:
        src_lines = src_file.readlines()
    formatted_lines = map(format_line, src_lines)
    formatted_content = ''.join(formatted_lines)
    with open(tgt_path, 'w') as tgt_file:
        tgt_file.write(formatted_content)


if __name__ == '__main__':
    assert len(sys.argv) == 3
    _, input_path, output_path = sys.argv
    format_file(input_path, output_path)
