import csv
import os

category_files = {
    "TOEIC": "toeicword.csv",
    "TOEFL": "toeflword.csv",
    "GTELP": "gtelpword.csv",
    "SUNEUNG": "suneungword.csv"
}

word_category = []

for category, filename in category_files.items():
    if os.path.exists(filename):
        with open(filename, encoding="utf-8") as f:
            for line in f:
                word = line.strip()
                if word:  # 빈 줄 제외
                    word_category.append((word, category))

# 중복 제거
word_category = list(set(word_category))

# CSV로 저장
with open("word_category_map.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(["word", "category"])
    for word, category in word_category:
        writer.writerow([word, category])

print("word_category_map.csv 파일이 생성되었습니다.")
