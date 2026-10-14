# 요리온 서버 배포 (Cloudflare Workers + D1, 무료 플랜 가능)

가게별 로그인, 휴대폰·PC 데이터 동기화, 영수증 사진 보관, 명세서 사진 인식을 한 서버에서 처리합니다.

```bash
npm i -g wrangler
wrangler login
cd worker

# 1) 데이터베이스 만들기 → 출력된 database_id 를 wrangler.toml 에 붙여넣기
wrangler d1 create yorion
wrangler d1 execute yorion --remote --file=schema.sql

# 2) 비밀값 등록 (코드/저장소에 넣지 마세요)
wrangler secret put ANTHROPIC_API_KEY   # Anthropic 콘솔에서 발급한 키
wrangler secret put TOKEN_SECRET        # 아무 긴 문자열 (예: openssl rand -hex 32 결과)

# 3) 배포 → 출력되는 https://yorion-api.<계정>.workers.dev 주소 확인
wrangler deploy
```

배포 후 `index.html`의 `const API_BASE="";` 에 위 주소를 넣고 푸시하면 공개 주소에서 로그인·동기화·사진 인식이 동작합니다.

- 허용 출처는 `index.js` 맨 위 `ALLOW_ORIGINS`에서 바꿉니다.
- 사진 인식과 영수증 보관함은 로그인한 사용자만 사용할 수 있습니다. 영수증 사진은 D1에 가게별 최근 50장까지 저장됩니다. Anthropic 콘솔에서 월 사용 한도를 설정하세요.
- 체험용 계정(gyeongsung / seokbunsik / gukbap, 비밀번호 1234)은 누구나 접속할 수 있어 데이터가 공유됩니다. 실제 가게는 가게 등록으로 가입하세요.
