# 명세서 인식 서버 배포 (Cloudflare Workers, 무료 플랜 가능)

```bash
npm i -g wrangler
wrangler login
cd worker
wrangler secret put ANTHROPIC_API_KEY   # 키를 붙여넣기 (코드/저장소에 넣지 마세요)
wrangler deploy                         # 출력되는 https://yorion-receipt.<계정>.workers.dev 주소를 사용
```

배포 후 `index.html`의 `const RECEIPT_API="";` 에 위 주소를 넣고 푸시하면 공개 주소에서 사진 인식이 동작합니다.

- 허용 출처는 `index.js` 맨 위 `ALLOW_ORIGINS`에서 바꿉니다.
- 누구나 호출할 수 있는 주소이므로 Anthropic 콘솔에서 월 사용 한도를 꼭 설정하세요.
