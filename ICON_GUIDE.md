# MagicVoca 아이콘 생성 가이드

## 현재 상태
✅ SVG 아이콘 생성 완료 (512x512)
✅ 그라데이션 배경 (보라-파랑)
✅ 마법 테마 (별, 반짝이)
✅ 중앙에 책과 'M' 로고

## 필요한 PNG 아이콘 크기
- 192x192px (Android 홈화면)
- 512x512px (Android 스플래시)
- 144x144px (권장)
- 72x72px, 96x96px, 128x128px (다양한 해상도)

## PNG 변환 방법
1. **온라인 도구 사용**:
   - https://convertio.co/svg-png/
   - 현재 /public/icon.svg 업로드
   - 각 크기별로 변환

2. **Figma/Canva 사용**:
   - SVG 임포트
   - 각 크기로 내보내기

3. **명령어 도구**:
   ```bash
   # ImageMagick 사용 (설치 필요)
   magick icon.svg -resize 192x192 pwa-192x192.png
   magick icon.svg -resize 512x512 pwa-512x512.png
   ```

## 파일 위치
생성된 PNG 파일들을 다음 위치에 저장:
- /public/pwa-192x192.png
- /public/pwa-512x512.png
- /public/apple-touch-icon.png (180x180)
- /public/favicon.ico

## 디자인 특징
- 🎨 **색상**: 보라-파랑 그라데이션 (#667eea → #764ba2)
- ✨ **테마**: 마법, 학습, 지식
- 📖 **심볼**: 책 + M 로고
- ⭐ **장식**: 마법의 별과 반짝이 효과
