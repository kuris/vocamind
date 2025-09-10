import csv
import re

def escape_sql_string(text):
    """SQL 문자열 이스케이프 처리"""
    if text is None:
        return 'NULL'
    # 작은따옴표를 두 개로 변경
    escaped = text.replace("'", "''")
    return f"'{escaped}'"

def generate_toeic_insert_sql():
    """toeicword.csv 파일을 읽어서 INSERT SQL 생성"""
    
    sql_lines = [
        "-- TOEIC 단어 데이터 복원 (toeicword.csv 기반)",
        "",
        "-- 기존 TOEIC 데이터 삭제",
        "DELETE FROM word_categories WHERE word_id IN (SELECT id FROM words WHERE category = 'toeic');",
        "DELETE FROM words WHERE category = 'toeic';",
        "",
        "-- TOEIC 단어 INSERT",
        "INSERT INTO words (english, korean, category) VALUES"
    ]
    
    insert_values = []
    
    try:
        with open('toeicword.csv', 'r', encoding='utf-8') as file:
            csv_reader = csv.DictReader(file)
            
            for row in csv_reader:
                english = row['english'].strip()
                korean = row['korean'].strip()
                
                # SQL VALUES 형태로 변환
                values = f"({escape_sql_string(english)}, {escape_sql_string(korean)}, 'toeic')"
                insert_values.append(values)
    
    except FileNotFoundError:
        print("toeicword.csv 파일을 찾을 수 없습니다.")
        return
    except Exception as e:
        print(f"오류 발생: {e}")
        return
    
    # VALUES를 콤마로 연결
    if insert_values:
        sql_lines.extend([
            insert_values[0] if len(insert_values) == 1 else insert_values[0] + ",",
        ])
        
        for i, value in enumerate(insert_values[1:], 1):
            if i == len(insert_values) - 1:  # 마지막 항목
                sql_lines.append(value + ";")
            else:
                sql_lines.append(value + ",")
    
    # SQL 파일 저장
    with open('toeic_words_complete.sql', 'w', encoding='utf-8') as file:
        file.write('\n'.join(sql_lines))
    
    print(f"✅ {len(insert_values)}개 단어로 toeic_words_complete.sql 파일이 생성되었습니다.")
    print("첫 5개 단어:")
    for i, value in enumerate(insert_values[:5]):
        print(f"  {i+1}. {value}")

if __name__ == "__main__":
    generate_toeic_insert_sql()
