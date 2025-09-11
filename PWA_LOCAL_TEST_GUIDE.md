# PWA 로컬 테스트 가이드

## 🔧 로컬 PWA 테스트 방법

### 1. 현재 실행 중인 Preview 서버
```
http://localhost:4173/
```
- 빌드된 PWA 버전 테스트 가능
- Service Worker 작동 확인 가능
- 아이콘은 확인 가능하지만 설치는 제한적

### 2. Chrome DevTools로 PWA 확인
1. **Chrome 개발자 도구** 열기 (F12)
2. **Application** 탭 선택
3. **Manifest** 확인:
   - 앱 이름: "MagicVoca - 마법의 단어학습"
   - 아이콘들이 올바르게 로드되는지 확인
4. **Service Workers** 확인:
   - 등록 상태 확인
   - 캐시 동작 확인

### 3. 로컬 HTTPS 서버 (권장)
```bash
# mkcert 설치 (한 번만)
choco install mkcert  # Windows
brew install mkcert   # Mac

# 로컬 인증서 생성
mkcert -install
mkcert localhost 127.0.0.1 ::1

# HTTPS로 실행
vite preview --https --cert localhost+2.pem --key localhost+2-key.pem
```

### 4. ngrok 사용 (가장 쉬운 방법)
```bash
# ngrok 설치 후
ngrok http 4173
```
- 실제 HTTPS URL 제공
- 모바일에서도 테스트 가능
- PWA 설치 완전 지원

### 5. Vercel/Netlify 배포 테스트
- 현재 배포된 사이트: https://magicvoca.vercel.app
- 실제 PWA 기능 완전 테스트 가능

## 📱 현재 문제 분석

현재 스크린샷에서 여전히 긴 제목이 나오는 이유:
1. **브라우저 캐시**: 이전 manifest 정보가 캐시됨
2. **iOS 특성**: iOS는 PWA 인식이 까다로움
3. **HTTPS 필요**: 로컬에서는 PWA 기능 제한적

## ✅ 해결 방법

### 즉시 테스트:
1. https://magicvoca.vercel.app 에서 테스트
2. 브라우저 캐시 완전 삭제 후 재시도
3. 시크릿/프라이빗 모드에서 테스트

### 로컬 완전 테스트:
1. ngrok으로 HTTPS 터널 생성
2. 모바일에서 ngrok URL 접속
3. PWA 설치 테스트
