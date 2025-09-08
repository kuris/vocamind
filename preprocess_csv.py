import re
input_file = 'koreanword.csv'
output_file = 'koreanword_preprocessed.csv'

with open(input_file, 'r', encoding='utf-8') as f:
    lines = f.readlines()

new_lines = []
for line in lines:
    # 첫 줄(헤더)은 그대로
    if line.startswith('korean,english'):
        new_lines.append(line)
        continue
    # 쉼표가 2개 이상이면 영어 컬럼에 쉼표가 포함된 것
    parts = line.strip().split(',')
    if len(parts) > 2:
        korean = parts[0]
        english = ','.join(parts[1:])
        # 영어 컬럼을 큰따옴표로 감싸기
        english = f'"{english}"'
        new_lines.append(f'{korean},{english}\n')
    else:
        new_lines.append(line)

with open(output_file, 'w', encoding='utf-8') as f:
    f.writelines(new_lines)

print(f'전처리 완료: {output_file}')
