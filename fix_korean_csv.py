
# 통합 스크립트: 전처리 + Gemini 교정
import pandas as pd
import requests
import google.generativeai as genai
import sys
import time
import os



ORIGINAL_CSV = 'koreanword.csv'
PREPROCESSED_CSV = 'koreanword_preprocessed.csv'
OUTPUT_CSV = 'koreanword_fixed.csv'

# 1. 전처리: 영어 컬럼에 쉼표가 있으면 큰따옴표로 감싸기
def preprocess_csv(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    new_lines = []
    for line in lines:
        if line.startswith('korean,english'):
            new_lines.append(line)
            continue
        parts = line.strip().split(',')
        if len(parts) > 2:
            korean = parts[0]
            english = ','.join(parts[1:])
            english = f'"{english}"'
            new_lines.append(f'{korean},{english}\n')
        else:
            new_lines.append(line)
    with open(output_file, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)
    print(f'전처리 완료: {output_file}')


PROMPT = '아래 문장의 한국어 오타, 띄어쓰기, 맞춤법을 모두 올바르게 고쳐줘. 문장만 반환해.'

# Gemini API 설정
GEMINI_API_KEY = os.getenv('GEMINI_API_KEY') or 'YOUR_GEMINI_API_KEY'
GEMINI_MODEL = 'models/gemini-1.5-flash-latest'
genai.configure(api_key=GEMINI_API_KEY)

def fix_korean(text):
    try:
        model = genai.GenerativeModel(GEMINI_MODEL)
        response = model.generate_content(f"{PROMPT}\n{text}", generation_config={"temperature": 0.2, "max_output_tokens": 128}, timeout=10)
        fixed = response.text.strip()
        return fixed
    except Exception as e:
        print(f'Gemini 오류: {e}')
        return text

def main():
    preprocess_csv(ORIGINAL_CSV, PREPROCESSED_CSV)
    df = pd.read_csv(PREPROCESSED_CSV)
    if 'korean' not in df.columns:
        print('csv에 "korean" 컬럼이 없습니다.')
        return
    fixed_list = []
    for i, row in df.iterrows():
        original = row['korean']
        fixed = fix_korean(original)
        fixed_list.append(fixed)
        print(f'{i+1}/{len(df)}: {original} -> {fixed}')
        time.sleep(1)  # Gemini API rate limit 대응
    df['korean_fixed'] = fixed_list
    df.to_csv(OUTPUT_CSV, index=False)
    print(f'수정된 파일 저장: {OUTPUT_CSV}')

if __name__ == '__main__':
    main()
