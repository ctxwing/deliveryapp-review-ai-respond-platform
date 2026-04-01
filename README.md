# 프로젝트 종료 마감임박 시점 개시로 미시작 미완료로 종료함.
- 2026.04.01 

# AI기반 리뷰 통합 관리 플랫폼 구축

> 배달앱 및 리뷰 플랫폼의 고객 리뷰를 AI가 자동으로 분석하고 답글을 생성하는 리뷰 운영 자동화 SaaS 플랫폼

[![Python](https://img.shields.io/badge/Python-3.11+-blue.svg)](https://www.python.org/)
[![Django](https://img.shields.io/badge/Django-5.0+-green.svg)](https://www.djangoproject.com/)
[![React](https://img.shields.io/badge/React-18+-cyan.svg)](https://react.dev/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📋 목차

- [프로젝트 개요](#프로젝트-개요)
- [핵심 기능](#핵심-기능)
- [기술 스택](#기술-스택)
- [아키텍처](#아키텍처)
- [프로젝트 헌법](#프로젝트-헌법)
- [설치 및 실행](#설치-및-실행)
- [프로젝트 구조](#프로젝트-구조)
- [개발 가이드](#개발-가이드)
- [참고 문서](#참고-문서)

---

## 프로젝트 개요

本项目是一个基于AI的评论集成管理平台，旨在帮助特许经营加盟店自动收集、分析并回复来自外卖平台（如 배민、요기요、쿠팡이츠等）的顾客评论。通过LLM技术，平台能够生成符合品牌调性的回复，并根据预设策略自动发布或提交管理员审核。

### 📊 프로젝트 정보

| 항목 | 내용 |
|:---|:---|
| **프로젝트명** | AI기반 리뷰 통합 관리 플랫폼 구축 |
| **코드명** | delivery-ai-responder-platform |
| **예산** | 20,000,000원 |
| **기간** | 120일 (약 17주) |
| **발주 형태** | 상세 기획, 디자인, 개발, 인프라 구성 전체 |
| **지원 디바이스** | 웹 기반 관리자 서비스 (향후 모바일 확장 고려) |

### 🎯 프로젝트 목표

1. **업무 자동화**: 고객 리뷰에 대한 답글 작성 업무를 자동화하여 가맹점주의 반복 업무 감소
2. **품질 표준화**: 브랜드별 톤앤매너를 반영한 일관된 답글로 고객 응대 품질 향상
3. **위험 관리**: 부정 리뷰, 저별점 리뷰, 민감한 리뷰는 별도 분류하여 관리자 확인 후 대응
4. **인사이트 제공**: 리뷰 데이터 분석으로 매장 운영 개선 및 본사 관리에 활용 가능한 인사이트 제공
5. **SaaS 확장**: 향후 프랜차이즈 본사와 가맹점이 함께 사용할 수 있는 SaaS형 서비스 구조

### 🔗 공고 링크

[위시켓 프로젝트 페이지](https://www.wishket.com/project/153923/)

---

## 핵심 기능

### 1. 리뷰 통합 수집

- 배달앱 및 주요 리뷰 채널의 리뷰를 통합 조회
- 매장별, 기간별, 플랫폼별 리뷰 조회 지원
- 리뷰 본문, 별점, 작성일시, 플랫폼명, 매장명 등 기본 정보 저장
- 실시간 또는 주기적인 신규 리뷰 수집

### 2. AI 답글 생성

| 기능 | 설명 |
|:---|:---|
| **문맥형 답변** | 단순 반복 문구가 아닌 리뷰 내용에 맞는 맞춤형 답글 생성 |
| **톤앤매너 반영** | 브랜드별 말투 스타일 (정중형, 친근형, 상냥형 등) 설정 |
| **타입 안전성** | PydanticAI로 구조화된 응답 보장 |

### 3. 자동답글 정책 설정

- 별점 기반 자동답글 설정 (예: 4~5점 자동, 1~3점 수동)
- 민감 키워드 기반 자동답글 제외 (환불, 위생, 이물질, 신고, 불친절 등)
- 자동 등록 전 대기시간 또는 예약 등록시간 설정
- 브랜드/매장별 별도 정책 적용

### 4. 승인 및 예외처리

- 저별점/부정/민감 키워드 포함 리뷰는 별도 검토함으로 분류
- 관리자 또는 점주가 AI 답글을 수정 후 등록 가능
- 자동답글 부적절 시 재생성 기능
- 등록 실패 또는 미응답 리뷰 알림

### 5. 리뷰 분석 및 대시보드

- 리뷰 감성 분류 (긍정/중립/부정)
- 주제별 분류 (맛, 양, 포장, 위생, 배달, 친절도 등)
- 매장별 통계: 리뷰 수, 평균 별점, 응답률, 부정리뷰 비율
- 반복 불만 유형 분석

### 6. 멀티테넌트 관리자

| 권한 | 기능 |
|:---|:---|
| **본사** | 전체 가맹점 리뷰 현황 조회, 브랜드 공통 정책 설정 |
| **가맹점** | 자신의 매장 리뷰만 조회 및 응답 |
| **운영자** | 전체 서비스 현황, 로그, 오류 내역 관리 |

---

## 기술 스택

### 백엔드

| 분야 | 기술 | 버전 |
|:---|:---|:---:|
| **프레임워크** | Django | 5.0+ |
| **API** | Django REST Framework | 3.14+ |
| **멀티테넌시** | Django-Tenants | - |
| **비동기 작업** | Celery + Redis | - |
| **데이터베이스** | PostgreSQL | 15+ |

### AI 엔진

| 분야 | 기술 | 설명 |
|:---|:---|:---|
| **LLM 오케스트레이션** | **PydanticAI** | 타입 안전한 구조화된 출력 |
| **LLM 공급자** | OpenAI / Claude | 상용 LLM API |
| **감성 분석** | HuggingFace Transformers | NLP 분류 |

### 프론트엔드

| 분야 | 기술 | 버전 |
|:---|:---|:---:|
| **프레임워크** | React | 18+ |
| **언어** | TypeScript | 5+ |
| **상태 관리** | React Query | - |
| **UI 컴포넌트** | Ant Design | - |

### 크롤링

| 분야 | 기술 | 설명 |
|:---|:---|:---|
| **Headless Browser** | Playwright | 배달앱 리뷰 수집 |
| **클라우드 스크래핑** | Apify (선택) | 크롤링 SaaS |
| **프록시** | Rotating IP | 차단 우회 |

### 인프라

| 분야 | 기술 |
|:---|:---|
| **클라우드** | AWS |
| **컨테이너** | Docker |
| **배포** | CI/CD 파이프라인 |

---

## 아키텍처

### 시스템 구조도

```
┌─────────────────────────────────────────────────────────────────┐
│                         리뷰 소스                                │
│  배달의민족  │  요기요  │  쿠팡이츠  │  네이버  │  구글            │
└──────────────────────┬──────────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│                      수집 계층                                   │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │  Playwright  │  │    Apify     │  │   Proxy      │          │
│  │  (Headless)  │  │   (Cloud)    │  │   (Rotating) │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
└──────────────────────┬──────────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│                      메시지 큐                                   │
│                    Celery + Redis                                │
└──────────────────────┬──────────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│                     Django API                                   │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │   Review     │  │    Policy    │  │   Tenant     │          │
│  │   Service    │  │   Engine     │  │  Management  │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
└──────────────────────┬──────────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│                      AI 엔진                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │ PydanticAI   │  │   OpenAI/    │  │   Brand      │          │
│  │  (Orchest.)  │  │   Claude     │  │  Prompts     │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
└──────────────────────┬──────────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│                    정책 엔진                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │  별점 기반    │  │  키워드 필터 │  │  승인 워크플로우│        │
│  │  자동화       │  │              │  │              │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
└──────────────────────┬──────────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│              PostgreSQL (멀티테넌트 DB)                           │
│  Brand │ Store │ Review │ Reply │ Policy │ AI_Log              │
└──────────────────────┬──────────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────────────────┐
│                    React 대시보드                                │
│  리뷰 현황 │ 답글 관리 │ 정책 설정 │ 통계 분석 │ 시스템 관리     │
└─────────────────────────────────────────────────────────────────┘
```

### ERD (핵심 엔티티)

```sql
Brand (프랜차이즈 본사)
├── id
├── name
└── Policy (1:1)

Store (가맹점)
├── id
├── brand_id (FK)
└── name

Platform (배달앱)
├── id
└── name

Review (리뷰)
├── id
├── store_id (FK)
├── platform_id (FK)
├── rating
├── content
├── sentiment
└── created_at

Reply (답글)
├── id
├── review_id (FK)
├── content
├── status (auto/manual/pending)
└── created_at

Policy (정책)
├── id
├── brand_id (FK)
├── auto_reply_threshold
└── banned_keywords

AI_Log (생성 로그)
├── id
├── review_id (FK)
├── prompt
├── response
└── model
```

---

## 프로젝트 헌법

이 프로젝트는 다음 **9개 핵심 원칙**을 따릅니다. ([상세 보기](.specify/memory/constitution.md))

| 원칙 | 요약 |
|:---|:---|
| **1. 한글 작성** | 모든 문서, 주석, 커밋 메시지는 한글로 작성 |
| **2. 시간대 표준** | 모든 시간은 KST (Asia/Seoul, UTC+9) 기준 |
| **3. 단일 브랜치** | `main` 브랜치만 운영 (feature/develop 금지) |
| **4. Django 표준** | 백엔드는 Python/Django 고정 |
| **5. PydanticAI** | 타입 안전한 LLM 오케스트레이션 |
| **6. 멀티테넌시** | Django-Tenants로 본사-가맹점 데이터 격리 |
| **7. 웹 우선** | 웹 기반 관리자 서비스 우선 개발 (앱은 Phase 2) |
| **8. 크롤링 안정성** | 배달앱 리뷰 수집 안정성 최우선 |
| **9. AI 품질 관리** | 저별점/민감 키워드는 수동 검토, 책임 소재 명확화 |

---

## 설치 및 실행

### 사전 요구사항

- Python 3.11+
- Node.js 18+
- PostgreSQL 15+
- Redis 7+
- Docker (선택)

### 백엔드 설정

```bash
# 백엔드 디렉토리 이동
cd backend

# 가상 환경 생성
python -m venv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate  # Windows

# 의존성 설치
pip install -r requirements.txt

# 환경 변수 설정 (.env)
cp .env.example .env
# .env 파일에 필요한 값 입력

# 데이터베이스 마이그레이션
python manage.py migrate

# 슈퍼유저 생성
python manage.py createsuperuser

# 개발 서버 실행
python manage.py runserver
```

### Celery (비동기 작업) 실행

```bash
# Celery worker
celery -A config worker -l info

# Celery beat (스케줄러)
celery -A config beat -l info
```

### 프론트엔드 설정

```bash
# 프론트엔드 디렉토리 이동
cd frontend

# 의존성 설치
npm install

# 환경 변수 설정
cp .env.example .env
# .env 파일에 필요한 값 입력

# 개발 서버 실행
npm run dev
```

### Docker로 실행 (선택)

```bash
# 전체 서비스 실행
docker-compose up -d

# 데이터베이스 초기화
docker-compose exec backend python manage.py migrate

# 슈퍼유저 생성
docker-compose exec backend python manage.py createsuperuser
```

---

## 프로젝트 구조

```
delivery-ai-responder-platform/
├── backend/                    # Django 백엔드
│   ├── apps/
│   │   ├── tenants/           # 멀티테넌트 관리
│   │   ├── reviews/           # 리뷰 수집 및 관리
│   │   ├── replies/           # 답글 생성 및 관리
│   │   ├── ai_engine/         # PydanticAI 엔진
│   │   ├── policies/          # 정책 관리
│   │   ├── analytics/         # 분석 및 대시보드
│   │   └── users/             # 사용자 및 권한
│   ├── config/                # Django 설정
│   ├── scrapy/                # 크롤러 (Playwright)
│   └── requirements.txt
├── frontend/                   # React 프론트엔드
│   ├── src/
│   │   ├── components/        # UI 컴포넌트
│   │   ├── pages/             # 페이지
│   │   ├── hooks/             # React Hooks
│   │   ├── services/          # API 서비스
│   │   └── stores/            # 상태 관리
│   └── package.json
├── .specify/                   # SpecKit 템플릿
├── 1_prd/                      # 고객 요구사항
├── 2_ctx/                      # 프로젝트 컨텍스트
├── 3_prj_docs/                 # 프로젝트 문서
│   └── 00_설계분석/
├── .specify/memory/            # 프로젝트 헌법
├── docker-compose.yml
└── README.md
```

---

## 개발 가이드

### 코딩 규칙

- **PEP 8** 준수 (Python)
- **ESLint** 규칙 준수 (TypeScript/React)
- 모든 함수와 클래스에 **Docstring** (한글)
- **타입 힌트** 사용 권장 (Python 3.11+)

### 커밋 메시지 규칙

```
<type>: <subject>

<body>

<footer>
```

**Type:**
- `feat`: 새로운 기능
- `fix`: 버그 수정
- `docs`: 문서 수정
- `style`: 코드 포맷팅
- `refactor`: 리팩토링
- `test`: 테스트
- `chore`: 기타

**예시:**
```
feat: 브랜드별 톤앤매너 설정 기능 추가

- Policy 모델에 tone_manner 필드 추가
- PydanticAI 프롬프트에 톤앤매너 반영 로직 구현
- 관리자 UI에서 톤앤매너 설정 가능

Refs: #123
```

### PR (Pull Request) 규칙

1. `main` 브랜치로 직접 PR (브랜치 전략 미사용)
2. PR 제목은 커밋 메시지 규칙 따름
3. PR 설명에 **변경 내용**과 **관련 이슈** 명시
4. 코드 리뷰 후 승인 필요

---

## 참고 문서

### 프로젝트 문서

| 문서 | 경로 |
|:---|:---|
| 고객 요구사항 | [1_prd/1_고객요구사항.md](1_prd/1_고객요구사항.md) |
| 설계분석 종합 | [3_prj_docs/00_설계분석/00_설계분석종합.md](3_prj_docs/00_설계분석/00_설계분석종합.md) |
| 프로젝트 헌법 | [.specify/memory/constitution.md](.specify/memory/constitution.md) |

### 외부 참고

| 자료 | 링크 |
|:---|:---|
| Django 문서 | https://docs.djangoproject.com/ |
| Django REST Framework | https://www.django-rest-framework.org/ |
| PydanticAI | https://github.com/pydantic-ai/pydantic-ai |
| Playwright | https://playwright.dev/python/ |
| React | https://react.dev/ |

---

## 라이선스

MIT License

---

**작성자**: ctxwing@gmail.com
**최종 수정일**: 2026-04-01
**프로젝트 헌법 버전**: v1.1.0
