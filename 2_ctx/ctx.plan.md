# 공통시힝

- 본 프로젝트의 개발에 가장 적합한 기술 스택을 분석하고 제시하라
- 별도의 지시된 기술 스택이 있다면 그것을 우선으로 한다
- 코드 내의 주석은 반드시 상단에 파일명과 작성일자, 코드 파일명, 용도, 주의 사항을 반드시 상세히 기록한다.

## DB

- DB는 MVP 개발중에는 pglite사용한다. 향후 DB변경을 고려하여 ORM(객체 관계형 매핑) 적용한다.
- 최종 상용화시에는 PostgresQL을 사용하되, 개발중 구성된 ORM(객체 관계형 매핑)을 사용한다.
- Drizzle ORM 정의하여 사용하라
- 필드 매핑 테이블 (snake_case)
- 필요시, DB 초기화 SQL 스크립트와 초기 SEED 데이터를 생성하는 스크립트를 반드시 제공하라

## UI/UX

- 사용자의 편의성을 최우선으로 고려한다
- 개발에 적합한 기술 스택을 분석하고, 설치과정이 복잡하지 않고, 결과화면이 미려한 방식으로 개발하여야한다.
- 화면의 UI컴포넌트는 모던하며 깔끔하며, 결과화면이 미려한 방식으로 개발하여야한다

# 프론트

## NextJS / React를 사용하는 경우

- nodejs는 반드시 22+을 사용한다.
  - 1) 모든 설치 및 실행 시 반드시 `bun`만을 사용한다. (`bun install`, `bun run`, `bunx` 사용)
  - 2) 어떠한 경우에도 `npm` 사용은 절대 금지하며, `pnpm`은 특별한 예외 사유 발생 시 사용자의 명시적 허락 하에서만 검토한다.
- Next.js: 16.1.X 이상을 적용한다
- 별도로 지시하지 않으면 Tailwind와 shadcn/ui를 적용한다.
- 파일업로드용 React 라이브러리는 Uppy,react-dronezone 순으로 사용한다.
- 목록, 테이블형 정보의 제공이 필요한 경우(특히 관리자 패널 등), **`ag-grid`**를 최우선으로 사용한다.
- 이 프로젝트에서는 window.alert을 절대 쓰지 않는다. 모든 알림은 toast를 사용하고 우하단에 표시한다. 공통요소를 이쁘게 만들고 공통으로 사용한다.
- 모든 버튼은 그 버튼이름에 적절한 아이콘을 반드시 버튼 이름 앞에 포함한다.

### 컴포넌트, 상태관리, 인증

- 상태관리: Zustand를 사용한다
- UI animation: React Bits (https://github.com/DavidHDev/react-bits)를 사용하여 미려하고 깔끔한 결과를 생성한다.
- 인증: Better Auth (https://github.com/better-auth/better-auth)를 사용한다

## 기능 UI

### 오픈소스 Notion & Miro 대체재: AFFiNE (https://github.com/toeverything/AFFiNE)

### Excalidraw (https://github.com/excalidraw/excalidraw)

- 손글씨 느낌을 재현해주는 가상의 칠판이라고 보시면 됩니다.
- 간단한 다이어그램을 그리거나 아이디어 스케치, UI 와이어프레임 등을 그리는데 사용할 수 있으며,데스크탑뿐만 아니라 태블릿에서도 편리하게 사용할 수 있습니다

## Flutter를 사용하는 경우

-Flutter SDK 3.35.7 + 을 사용

- 모든 Dart Null Safety 에러 필수 해결

# 백엔드 / 풀스택

## Payload 를 사용하는 경우

- 특별히 지시되지 않으면 기본 Headeless CMS는 Payload를 사용한다.
- 설치 및 실행 시 반드시 `pnpm`을 사용한다.
- https://github.com/payloadcms/payload
- https://payloadcms.com/

## strapi 를 사용하는 경우

- strapi 사용 시 버전은 5+, TS를 적용한다.
- 설치 및 실행 시 반드시 **`bun`**을 사용한다. (npm/pnpm 사용 금지)
- **DB 설정**: SQLite 사용 시 DB 파일은 반드시 `prj_source/backend/database/data.db`에 위치하도록 설정한다. (.tmp 폴더 사용 금지)

## python을 사용하는 경우

- python을 사용하는 경우 python=3.13+을 사용한다.
- python 명령어 수행 시에는, 반드시 uv(패키지관리자)로 만들어진 가상환경을 사용하라. 없다면 생성할지 여부를 사용자에게 반드시 질문하라
- API관련 사항은 FastAPI를 사용하고 scalar 을 구현한다. 내용은 한글로 작성하고, 예시 파라라미터를 상세히 설명한다.
- FastAPI는 0.116.1+ (2025년 7월 11일 릴리스) 버전을 사용한다.
# Desktop

## Tauri (https://github.com/tauri-apps/tauri)

# Docker 사용하는 경우

## 🛠 Docker 구성 프롬프트 (최종 고도화 버전)

### [기본 원칙]

#### 1. **포트 충돌 방지:** Well-known 포트(5432, 3306, 80 등) 사용 금지. 반드시 본 프로젝트 지정 포트를 사용한다.
  - **프론트엔드**: 57100
  - **백엔드 (FastAPI)**: 57101
  - **Redis**: 57102
  - **기타 (MinIO 등)**: 57103~ 영역을 사용하며 중복 여부를 확인한다.

#### 2. **환경 설정:** `.env` 파일은 프로젝트 루트와 혼선되지 않도록 Docker 전용 파일(예: `.env.docker` 또는 명시적 지정)을 정의하고 활용할 것.

### [docker-compose.yml 작성 규격]

#### 1. **상단 주석 (Header):**

- - 서비스 명칭, 주요 스택 버전, 포트 맵핑(Host:Container), 볼륨 경로 요약 포함.
- - 제공된 템플릿의 시각적 구분선 스타일 준수.

#### 2. **이미지(Image):**

- - `hub.docker.com` 또는 `Quay.io` 공식 이미지 사용.
- - `latest` 사용 금지. 최신 안정화 버전(Stable Tag) 명시.

#### 3. **볼륨(Volumes):**

- - Named Volume 사용 금지. 호스트 디렉토리 바인드 마운트만 사용.
- - `./data/{service}` 등 프로젝트 하위 경로로 고정.

#### 4. **리소스 및 재시작 (Resources & Restart):**

- - `restart: unless-stopped` 기본 적용.
- - `mem_limit` 설정 및 GPU 사용 허가(`deploy.resources`).

#### 5. **상태 확인 (Healthcheck):**

- - 서비스 가용성 검증을 위한 `healthcheck` 구문을 반드시 포함할 것. (test, interval, timeout, retries 명시)

---

#### 📄 에이전트 출력 예시 (참조용)

```yaml
# ==============================================================================
# [서비스명] Docker 설정
# - 외부 포트: [Host Port] (지정 필수)
# - 데이터: ./data/[Service] 바인드 마운트
# ==============================================================================

services:
  database:
    image: postgres:16-alpine
    container_name: ctx-db
    restart: unless-stopped
    env_file: .env.docker
    ports:
      - "${DB_HOST_PORT}:5432" # 5432 직접 사용 금지, 외부 지정 포트 매핑
    volumes:
      - ./data/postgres:/var/lib/postgresql/data
    deploy:
      resources:
        limits:
          memory: 2gb
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U $${POSTGRES_USER} -d $${POSTGRES_DB}"]
      interval: 10s
      timeout: 5s
      retries: 5
```

---
