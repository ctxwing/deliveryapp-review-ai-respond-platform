# 설계분석 — ChatGPT Pro Project (BC)
yes

아래는 요구사항 기반 **풀 분석 (STEP 1~4)** 결과임. (Deep Research 기반 설계 수준으로 작성)

---

# STEP 1: 요구사항 정제 및 명명

## 1.1 요구사항 정리

### 📌 프로젝트 개요

| 항목   | 내용                                     |
| ---- | -------------------------------------- |
| 프로젝트 | AI 기반 리뷰 통합 관리 플랫폼                     |
| 예산   | 2,000만원                                |
| 기간   | 120일                                   |
| 플랫폼  | Web (우선), 이후 모바일 확장                    |
| 스택   | Python(Django), React, PostgreSQL, AWS |
| 구조   | SaaS 확장 고려                             |

---

### 📌 핵심 기능 요구사항

| 구분    | 상세                 |
| ----- | ------------------ |
| 리뷰 수집 | 배달앱/플랫폼 리뷰 통합 수집   |
| AI 답글 | 리뷰 기반 자동/반자동 답글 생성 |
| 정책 설정 | 별점/키워드 기반 자동화      |
| 승인/예외 | 저평점/민감 리뷰 수동 처리    |
| 분석    | 감성/주제 분석 + 대시보드    |
| 관리자   | 본사-가맹점 구조 권한 관리    |

---

### 📌 AI 요구사항

| 항목 | 내용             |
| -- | -------------- |
| 입력 | 리뷰, 별점, 브랜드 정책 |
| 출력 | 자연어 답글         |
| 제어 | 금지어, 톤앤매너      |
| 확장 | 프롬프트 관리 가능     |

---

### 📌 운영 요구사항

| 항목   | 내용           |
| ---- | ------------ |
| 로그   | 수집/답글/오류 이력  |
| 통계   | 응답률, 별점, VOC |
| SaaS | 과금 구조 확장     |

---

## 1.2 프로젝트 코드명

1. review-ai-automation-saas-platform
2. franchise-review-response-ai-system
3. review-unification-ai-reply-management-web
4. customer-feedback-ai-response-automation-platform
5. review-analytics-ai-reply-saas-engine

---

# STEP 2: 아키텍처 분석

## 2.1 핵심 요구사항 (비중)

| 항목              | 비중  |
| --------------- | --- |
| 리뷰 수집 (크롤링/API) | 25% |
| AI 답글 생성        | 20% |
| 정책 엔진           | 15% |
| 관리자/권한          | 15% |
| 분석/대시보드         | 15% |
| SaaS 구조         | 10% |

---

## 2.2 WBS 기반 모듈 분해

| 모듈         | 설명          | 비중  | 난이도   |
| ---------- | ----------- | --- | ----- |
| A. 리뷰 수집   | API/크롤링     | 25% | ⭐⭐⭐⭐⭐ |
| B. AI 엔진   | LLM 기반 생성   | 20% | ⭐⭐⭐⭐  |
| C. 정책 엔진   | rule 기반 자동화 | 15% | ⭐⭐⭐   |
| D. 관리자 시스템 | RBAC        | 10% | ⭐⭐⭐   |
| E. 분석 엔진   | NLP 분류      | 10% | ⭐⭐⭐⭐  |
| F. 대시보드    | 시각화         | 10% | ⭐⭐    |
| G. SaaS 구조 | 멀티테넌시       | 10% | ⭐⭐⭐⭐  |

---

## 2.3 상용 솔루션 비교

| 솔루션       | 유사도   | 인기도   | 장점      | 단점        | 러닝커브 | 라이선스 | 비용 |
| --------- | ----- | ----- | ------- | --------- | ---- | ---- | -- |
| Sprinklr  | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 엔터프라이즈급 | 비쌈        | ⭐⭐⭐⭐ | 상용   | 유료 |
| Zendesk   | ⭐⭐⭐⭐  | ⭐⭐⭐⭐⭐ | 안정성     | AI 약함     | ⭐⭐⭐  | 상용   | 유료 |
| Freshdesk | ⭐⭐⭐⭐  | ⭐⭐⭐⭐  | UX 좋음   | 분석 제한     | ⭐⭐⭐  | 상용   | 유료 |
| Podium    | ⭐⭐⭐⭐  | ⭐⭐⭐⭐  | 리뷰 집중   | 커스터마이징 제한 | ⭐⭐⭐  | 상용   | 유료 |
| Birdeye   | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐  | 리뷰 특화   | 한국 서비스 제한 | ⭐⭐⭐  | 상용   | 유료 |

👉 총평
→ "이미 완성된 SaaS" 영역이라 경쟁 불리
→ 대신 **니치(배달앱 특화)**로 가야함

---

## 2.3.2 오픈소스

| OSS      | 유사도  | 인기도   | 장점         | 단점       | 러닝커브 | 라이선스   |
| -------- | ---- | ----- | ---------- | -------- | ---- | ------ |
| Chatwoot | ⭐⭐⭐⭐ | ⭐⭐⭐⭐  | CRM+채팅     | 리뷰 수집 없음 | ⭐⭐⭐  | MIT    |
| Saleor   | ⭐⭐⭐  | ⭐⭐⭐⭐  | SaaS 구조 좋음 | 도메인 다름   | ⭐⭐⭐⭐ | BSD    |
| Supabase | ⭐⭐⭐  | ⭐⭐⭐⭐⭐ | 백엔드 빠름     | AI 없음    | ⭐⭐   | Apache |
| Metabase | ⭐⭐   | ⭐⭐⭐⭐  | 분석 강점      | AI 없음    | ⭐⭐   | AGPL   |
| LangFlow | ⭐⭐⭐⭐ | ⭐⭐⭐⭐  | LLM 워크플로우  | 운영 미성숙   | ⭐⭐⭐  | MIT    |

👉 총평
→ **완전 일치 없음 → 조립형 필수**

---

## 2.4 레고 블록 (핵심)

### 🔥 Base (뼈대)

| 이름           | 역할     |
| ------------ | ------ |
| Django + DRF | 메인 백엔드 |
| React Admin  | 관리자 UI |
| PostgreSQL   | 데이터    |

---

### 🔧 Unit 모듈

| 모듈    | OSS               | 유사도   | 특징                |
| ----- | ----------------- | ----- | ----------------- |
| 리뷰 수집 | Apify             | ⭐⭐⭐⭐⭐ | 크롤링 SaaS          |
| AI 생성 | LangChain         | ⭐⭐⭐⭐⭐ | LLM orchestration |
| 감성 분석 | HuggingFace       | ⭐⭐⭐⭐  | NLP               |
| 정책 엔진 | json-rules-engine | ⭐⭐⭐⭐  | rule 기반           |
| 큐 처리  | Celery            | ⭐⭐⭐⭐⭐ | 비동기 처리            |

---

## 2.5 최종 아키텍처 (핵심)

### ✅ 조립 전략

👉 **Skeleton**

* Django (40%)

👉 **AI Layer**

* LangChain + OpenAI (20%)

👉 **수집 Layer**

* Apify + 자체 크롤러 (20%)

👉 **분석**

* HuggingFace (10%)

👉 **Infra**

* Celery + Redis (10%)

---

### 📌 구조 요약

```
[Review Source]
   ↓
[Collector (Apify/Crawler)]
   ↓
[Django API]
   ↓
[AI Engine (LangChain)]
   ↓
[Policy Engine]
   ↓
[DB + Dashboard]
```

---

### 📌 핵심 전략

| 전략     | 설명           |
| ------ | ------------ |
| API 우선 | 크롤링 최소화      |
| AI 분리  | Prompt 관리 독립 |
| SaaS   | Tenant 구조    |
| Queue  | 실시간 처리       |

---

# STEP 3: 비용 및 기간

## 3.1 개발 분석

| 단계     | 비중  | 기간 |
| ------ | --- | -- |
| 설계     | 10% | 2주 |
| 수집 시스템 | 25% | 4주 |
| AI 엔진  | 20% | 3주 |
| 정책 엔진  | 10% | 2주 |
| 관리자    | 15% | 3주 |
| 분석     | 10% | 2주 |
| 테스트    | 10% | 2주 |

👉 총 기간: **16주 (≈ 120일)**

---

## 💰 비용

| 항목     | 비용         |
| ------ | ---------- |
| 개발     | 2,000만원    |
| AI API | 월 50~200만원 |
| 크롤링    | 월 30~100만원 |
| AWS    | 월 30~80만원  |

---

# STEP 4: 의사결정 분석

## 📊 점수

| 항목   | 점수 |
| ---- | -- |
| 재사용성 | 18 |
| 경쟁력  | 13 |
| 시장성  | 14 |
| 자산화  | 9  |
| 수익성  | 8  |
| IP   | 9  |
| 확장성  | 5  |
| 명확성  | 4  |
| 기술성장 | 5  |
| 유지보수 | 4  |

👉 총점: **89점**

---

## ✅ 결론

👉 **Go (강력 추천)**

---

## 👍 해야하는 이유

1. SaaS 확장 → 반복 수익 가능
2. AI + 크롤링 → 진입장벽 높음
3. 프랜차이즈 시장 → 지속 수요

---

## ❌ 리스크

1. 배달앱 API 없음 → 크롤링 리스크
2. AI 품질 → 브랜드 리스크
3. 정책 복잡도 → 유지보수 비용 증가

---

# 🔥 최종 한줄 결론

👉 **"Django 기반 SaaS + LangChain + 크롤링 조합"이 가장 현실적이며, 이 프로젝트는 장기적으로 SaaS 제품화 가능한 고가치 구조임**

---
yes

요청한 3개 (GitHub 조합 / ERD / 크롤링 현실 분석) 전부 이어서 설계함.

---

# 1️⃣ GitHub 레포 조합 (3년 이내, 실사용 가능)

## 🔥 핵심 기준

* 2023~2026 active
* Python / React 중심
* SaaS 구조 가능
* 실제 운영 사례 있음

---

## 📦 Base + Unit 조합

| 구분             | Repo                                                                                                                   | 생성일  | 유사도   | 인기도   | 장점         | 단점            | 난이도  | 라이선스   |
| -------------- | ---------------------------------------------------------------------------------------------------------------------- | ---- | ----- | ----- | ---------- | ------------- | ---- | ------ |
| **Base**       | [https://github.com/tiangolo/full-stack-fastapi-postgresql](https://github.com/tiangolo/full-stack-fastapi-postgresql) | 2023 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | SaaS 구조 완성 | Django 아님     | ⭐⭐⭐  | MIT    |
| Base           | [https://github.com/django-cms/django-cms](https://github.com/django-cms/django-cms)                                   | 2024 | ⭐⭐⭐⭐  | ⭐⭐⭐⭐  | Django 친화  | SaaS 직접 구현 필요 | ⭐⭐⭐  | BSD    |
| Base           | [https://github.com/saleor/saleor](https://github.com/saleor/saleor)                                                   | 2024 | ⭐⭐⭐   | ⭐⭐⭐⭐⭐ | 멀티테넌시      | 무거움           | ⭐⭐⭐⭐ | BSD    |
| Unit (AI)      | [https://github.com/langchain-ai/langchain](https://github.com/langchain-ai/langchain)                                 | 2025 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | LLM 표준     | 복잡            | ⭐⭐⭐⭐ | MIT    |
| Unit (Queue)   | [https://github.com/celery/celery](https://github.com/celery/celery)                                                   | 지속   | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 안정성        | 설정 복잡         | ⭐⭐⭐⭐ | BSD    |
| Unit (Crawler) | [https://github.com/apify/apify-sdk-python](https://github.com/apify/apify-sdk-python)                                 | 2025 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐  | 크롤링 최강     | 유료 요소         | ⭐⭐⭐  | Apache |
| Unit (NLP)     | [https://github.com/huggingface/transformers](https://github.com/huggingface/transformers)                             | 2025 | ⭐⭐⭐⭐  | ⭐⭐⭐⭐⭐ | 모델 다양      | 무거움           | ⭐⭐⭐⭐ | Apache |
| Unit (Rules)   | [https://github.com/CacheControl/json-rules-engine](https://github.com/CacheControl/json-rules-engine)                 | 2023 | ⭐⭐⭐⭐  | ⭐⭐⭐   | 정책 엔진      | 기능 제한         | ⭐⭐⭐  | MIT    |

---

## 🔥 추천 조합 (현실 최적)

| 레이어      | 선택                  |
| -------- | ------------------- |
| Backend  | Django + DRF        |
| AI       | LangChain           |
| Queue    | Celery + Redis      |
| Crawling | Apify + Custom      |
| NLP      | HuggingFace         |
| Front    | React + React Query |

---

## 📌 핵심 판단

👉 FastAPI boilerplate 더 좋지만
👉 **고객 요구 = Django → 그대로 유지**

---

# 2️⃣ DB ERD 설계

## 📌 핵심 엔티티

### 🔥 핵심 구조

| 테이블      | 설명       |
| -------- | -------- |
| Brand    | 프랜차이즈 본사 |
| Store    | 가맹점      |
| Platform | 배달앱      |
| Review   | 리뷰       |
| Reply    | 답글       |
| Policy   | 정책       |
| AI_Log   | 생성 로그    |

---

## 📊 ERD 구조

```sql
Brand
- id
- name

Store
- id
- brand_id
- name

Platform
- id
- name

Review
- id
- store_id
- platform_id
- rating
- content
- sentiment
- created_at

Reply
- id
- review_id
- content
- status (auto/manual/pending)
- created_at

Policy
- id
- brand_id
- auto_reply_threshold
- banned_keywords

AI_Log
- id
- review_id
- prompt
- response
- model
```

---

## 📌 관계 구조

| 관계             | 설명  |
| -------------- | --- |
| Brand → Store  | 1:N |
| Store → Review | 1:N |
| Review → Reply | 1:1 |
| Brand → Policy | 1:1 |

---

## 📌 SaaS 확장 핵심

| 항목     | 전략           |
| ------ | ------------ |
| 멀티테넌시  | brand_id 기반  |
| 데이터 격리 | row-level    |
| 확장     | schema 분리 가능 |

---

# 3️⃣ 크롤링 현실 분석 (배민 / 쿠팡이츠 등)

## 🚨 핵심 결론

👉 yes
**"완전 자동 수집 가능 BUT 안정성 매우 낮음"**

---

## 📊 플랫폼별 분석

| 플랫폼    | API 존재 | 크롤링 난이도 | 위험도   | 현실성   |
| ------ | ------ | ------- | ----- | ----- |
| 배달의민족  | ❌      | ⭐⭐⭐⭐⭐   | 매우 높음 | 낮음    |
| 쿠팡이츠   | ❌      | ⭐⭐⭐⭐⭐   | 매우 높음 | 낮음    |
| 요기요    | ❌      | ⭐⭐⭐⭐    | 높음    | 낮음    |
| 네이버 리뷰 | 일부     | ⭐⭐⭐     | 중간    | 가능    |
| 구글 리뷰  | API 있음 | ⭐⭐      | 낮음    | 매우 높음 |

---

## 📌 문제 핵심

| 문제       | 설명         |
| -------- | ---------- |
| 로그인 필요   | 대부분 인증     |
| anti-bot | Cloudflare |
| DOM 변경   | 잦음         |
| 법적 리스크   | 존재         |

---

## 🔥 현실적 수집 전략 (추천)

### ✅ 전략 1 (가장 현실적)

| 방식          | 설명               |
| ----------- | ---------------- |
| 매장주 계정 연결   | OAuth or 로그인 저장  |
| 내부 scraping | headless browser |
| 주기 수집       | Celery           |

---

### ✅ 전략 2 (안전)

| 방식          | 설명      |
| ----------- | ------- |
| API 제공 플랫폼만 | 네이버/구글  |
| 나머지 수동      | CSV 업로드 |

---

### ✅ 전략 3 (확장형)

| 방식          | 설명     |
| ----------- | ------ |
| Apify Actor | 자동 크롤러 |
| 프록시         | 차단 회피  |
| Queue       | 비동기    |

---

## 🔥 추천 아키텍처

```id="crawl-arch"
[User Account]
   ↓
[Headless Browser (Playwright)]
   ↓
[Proxy Layer]
   ↓
[Parser]
   ↓
[Django API]
```

---

## 📌 기술 스택

| 영역  | 기술                  |
| --- | ------------------- |
| 크롤링 | Playwright          |
| 우회  | Proxy / Rotating IP |
| 스케줄 | Celery              |
| 파싱  | BeautifulSoup       |

---

## 🚨 반드시 고려

| 항목   | 내용        |
| ---- | --------- |
| 법적   | TOS 위반 가능 |
| 유지보수 | 매우 큼      |
| 안정성  | 낮음        |

---

# 🔥 최종 통합 결론

## 📌 전체 구조

```id="final-arch"
[Review Source]
   ↓
[Collector (Playwright + Apify)]
   ↓
[Queue (Celery)]
   ↓
[Django API]
   ↓
[AI Engine (LangChain)]
   ↓
[Policy Engine]
   ↓
[DB + Dashboard]
```

---

## 📌 핵심 성공 포인트

| 항목      | 설명       |
| ------- | -------- |
| 크롤링     | 가장 큰 리스크 |
| AI 품질   | 경쟁력 핵심   |
| 정책 엔진   | 실무 핵심    |
| SaaS 구조 | 수익 핵심    |

---

# 🔥 진짜 핵심 한줄

👉 **"이 프로젝트는 AI보다 크롤링이 더 어렵고, 성공 여부는 수집 안정성에서 결정됨"**

---

원하면 다음 단계로
👉 **실제 Django 코드 구조 (폴더 설계)**
👉 **LangChain Prompt 설계 (실전 템플릿)**
👉 **관리자 UI 구조 (React Admin 설계)**

까지 바로 이어서 설계해줌
