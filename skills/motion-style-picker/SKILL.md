---
name: motion-style-picker
description: "Motion graphics style picker for when you don't know the style name. 모션그래픽 스타일 이름을 모르겠어? 모션그래픽 스타일이름 모를 때, 모션 그래픽 스타일 추천. I don't know the name of the motion graphics style / animation style. Shows an animated preview gallery of 30 motion styles (kinetic typography, isometric, glitch, liquid morph, 3D clay, claymation, glass, chrome, low-poly, inflatable, line art...) in English or Korean, asks multiple-choice questions on purpose, animation type and tempo, then writes a scene breakdown and an English motion prompt. 움직이는 미리보기 갤러리 30종을 보고 고르면 장면 구성과 영어 모션 프롬프트를 만들어 줍니다. Use when: 모션그래픽 스타일 이름 모름, 애니메이션 스타일 고르기, 3D 클레이 애니메이션, 영상 멋지게, 로고 인트로, 설명 영상, 숏폼 광고, motion design style, animation style picker, make my video look cool."
---

# Motion Style Picker

사람들은 모션그래픽 스타일 이름(키네틱 타이포, 아이소메트릭, 러버호스…)을 몰라서 "영상 멋지게", "움직이게"라고만 말합니다. 이 스킬은 객관식으로 용도를 묻고, **사용자의 글자로 실제로 움직이는 미리보기 갤러리**로 스타일을 고르게 하고, 다시 객관식으로 움직임과 세부 사항을 정한 뒤, 그대로 재현할 수 있는 프롬프트를 만듭니다.

People rarely know motion-style names. This skill asks a few multiple-choice questions, shows an animated gallery so the user picks by sight, then produces a scene breakdown and a ready-to-paste English motion prompt. Reply in the user's language.

## 파일 구성 / Files

- `SKILL.md` : 진행 순서와 스타일·유형 데이터, 맨 아래 갤러리 HTML (이 파일만 있어도 동작)
- `assets/gallery.html` : 브라우저에서 바로 열 수 있는 독립 실행판 갤러리

## 질문 방법

- `AskUserQuestion` 도구가 있으면 그것으로 묻습니다. 한 번에 최대 4문항, 문항당 2~4개 선택지. "기타"는 자동으로 붙으므로 직접 넣지 않습니다.
- 도구가 없으면 같은 질문을 번호 목록으로 보여 주고 "1-B, 2-A처럼 답해 주세요"라고 안내합니다. 이때는 선택지를 4개보다 많이 보여 줘도 됩니다.
- 사용자가 이미 대화에서 말한 항목(예: "유튜브 쇼츠용")은 묻지 않고 건너뜁니다.
- 선택지마다 짧은 설명(description)을 붙여 이름을 몰라도 고를 수 있게 합니다.
- 사용자가 "목록 보여줘", "어떤 스타일 있어?", "show me the styles"처럼 스타일부터 보고 싶다고 하면 1라운드를 건너뛰고 바로 갤러리를 띄웁니다. 1라운드 질문은 스타일을 고른 뒤에 묻습니다.

## 언어 / Language

사용자가 쓰는 언어로 진행합니다. 한국어면 아래 한국어 선택지를, 영어(또는 그 밖의 언어)면 English options를 씁니다. 갤러리는 브라우저 언어에 따라 한국어/English로 뜨고, 오른쪽 위 버튼으로 바꿀 수 있습니다. 결과의 **English motion prompt**는 언어와 상관없이 항상 영어로 씁니다.

Reply in the user's language. For English users use these option labels:

| Round | Question (header) | Options |
|---|---|---|
| 1 | Purpose (Purpose, multi) | Logo / brand intro · Explainer video · Social ad / short-form · App / web UI motion |
| 1 | Aspect ratio (Ratio) | 16:9 landscape · 9:16 vertical · 1:1 square · 4:5 feed |
| 1 | Output (Output) | Prompt only · HTML animation · MP4 video · After Effects brief |
| 2 | Animation types (Motion, multi) | pick 4 from the type table (English column) |
| 2 | Tempo (Tempo) | Smooth & calm · Springy bounce · Snappy cuts · Slow & dreamy |
| 3 | Length (Length) | 3–6 s · 10–15 s · 30 s · 60 s+ |
| 3 | Elements (Elements, multi) | Logo · Title / copy · Character / icons · Numbers / charts |
| 3 | Colour (Colour) | Brand colours (tell me) · Black & white · Bright pastel · Dark + accent |
| 3 | Ending (Ending) | Synced to music · No sound · Seamless loop · End on logo / CTA |

When the gallery button is pressed in English, the message looks like `Motion style picked → main: 3d-clay (3D clay), accent: none · text: "Morning Coffee"`. Use that text in the scenes and prompt. Treat it the same as the Korean message. Write the summary and scene breakdown in English for English users.

## 1라운드: 무엇을, 어디에 (3문항)

1. **용도** (header: 용도, multiSelect: true)
   - 로고·브랜드 인트로 / 설명·교육 영상 / SNS 광고·숏폼 / 앱·웹 UI 모션
   - (기타 예: 발표 화면 전환, 루프 배경, 데이터 리포트)
2. **화면 비율** (header: 비율)
   - 16:9 가로 / 9:16 세로(쇼츠·릴스) / 1:1 정사각 / 4:5 피드
3. **결과물** (header: 결과물)
   - 프롬프트만 (다른 툴에 붙여넣기) / HTML 애니메이션 / MP4 영상 / After Effects·작업 지시서

분위기나 스타일은 여기서 객관식으로 묻지 않습니다. 바로 다음 단계의 갤러리에서 예시를 보고 고릅니다.
답이 빠진 문항은 기본값(비율 16:9, 결과물 프롬프트만)으로 정하고, 갤러리를 띄울 때 어떻게 정했는지 한 줄로 알려 줍니다. "1-3"처럼 범위로 답하면 그 범위의 선택지를 모두 고른 것으로 봅니다.

## 스타일 고르기: 움직이는 미리보기 갤러리

스타일은 **객관식 목록이 아니라 갤러리로 보여 줍니다.** 사용자는 이름이나 느낌을 나타내는 단어보다 실제로 움직이는 예시를 보고 고르는 쪽을 원합니다.

**A. 채팅 환경 (Visualizer `show_widget` 도구가 있을 때 — Claude.ai, Claude 데스크톱 등)**
1. 이 대화에서 처음 쓰는 거라면 Visualizer `read_me`(modules: interactive)를 먼저 조용히 호출합니다.
2. 이 파일 맨 아래 **갤러리 HTML**을 한 글자도 바꾸지 않고 `show_widget`의 `widget_code`로 넘깁니다. title은 `motion_style_gallery`입니다.
3. 위젯 앞에는 1라운드 답을 어떻게 이해했는지와 기본값으로 정한 것을 한두 문장으로 쓰고, "아래는 스타일마다 실제로 움직이는 미리보기 갤러리예요"로 끝냅니다.
4. 위젯 뒤에는 사용자 언어로 이렇게 안내합니다. "위 칸에 영상에 들어갈 글자를 쓰면 모든 미리보기가 그 글자로 바뀌어요. 카드를 누르면 '메인 ✓', 하나 더 누르면 '보조 ✓'가 붙어요(보조는 선택 사항). 다 고른 뒤 아래 버튼을 눌러 주세요." 영어: "Type your words in the box and every preview uses them. Click a card for Main ✓, another for Accent ✓ (optional), then press Continue."
   - 사용자가 대화에서 이미 글자(브랜드명·카피)를 말했다면 위젯 앞 문장에서 "위 칸에 ○○을 넣어 보세요"라고 알려 줍니다. 위젯 코드는 바꾸지 않습니다.
5. 버튼을 누르면 `모션 스타일 선택 → 메인: kinetic-type (키네틱 타이포), 보조: glitch (글리치) · 글자: "오늘의 커피"` 같은 메시지가 들어옵니다(영어 화면이면 `Motion style picked → main: … · text: "…"`). 이 메시지가 오면 바로 2라운드로 넘어가고, `글자`는 장면 구성과 프롬프트에 그대로 씁니다(따로 다시 묻지 않음).

**B. 셸이 있는 코딩 도구 (Claude Code, Codex, Cursor, Gemini CLI 등)**
1. 이 스킬 폴더의 `assets/gallery.html`을 OS 임시 폴더에 복사해 브라우저로 엽니다(macOS `open`, Linux `xdg-open`, Windows `start`). 파일이 없으면 아래 갤러리 HTML 앞에 `<!doctype html><meta charset="utf-8"><style>:root{--border:#ddd;--border-accent:#378add;--surface-2:#fff;--text-secondary:#666;--text-danger:#c00}body{font-family:sans-serif;padding:16px}.sr-only{position:absolute;left:-9999px}</style><script>function sendPrompt(t){navigator.clipboard.writeText(t).then(()=>alert('복사됨 / Copied: '+t))}</script>`를 붙여 파일로 만듭니다.
2. "카드를 고르고 버튼을 누르면 문장이 복사돼요. 여기에 붙여 넣어 주세요"라고 안내합니다. 브라우저를 열 수 없으면 파일 경로를 알려 주고 C 방식도 함께 보여 줍니다.

**C. 둘 다 안 될 때 (ChatGPT 등 위젯·셸 없음)**
- 아래 **스타일표**를 후보표의 느낌별로 묶어 "한글 이름: 한 줄 설명" 목록으로 보여 주고, 이름이나 번호로 고르게 합니다.

## 2라운드: 움직임 (2문항)

1. **애니메이션 유형** (header: 움직임, multiSelect: true) — 용도에 맞는 4개를 **유형표**에서 고름
   - 로고 인트로 → 라인 드로잉, 마스크 리빌, 모프, 파티클
   - 설명 영상 → 순차 등장, 라인 드로잉, 카운트업·차트, 카메라 줌
   - SNS 숏폼 → 키네틱 텍스트, 팝·바운스, 와이프 전환, 비트 싱크 컷
   - UI 모션 → 페이드·슬라이드, 스케일 팝, 공유 요소 전환, 마이크로 인터랙션
   - 용도를 여러 개 골랐다면 각 용도에서 하나씩 섞어 4개를 만들고, 고른 스타일과 잘 맞는 것을 먼저 놓습니다.
2. **속도·리듬** (header: 템포)
   - 부드럽고 차분 (ease-in-out) / 통통 튀는 탄력 (spring, overshoot) / 빠르고 딱딱 끊김 (snappy) / 느리고 몽환적 (slow drift)

## 3라운드: 필요한 것 (최대 4문항, 필요한 것만)

1. **길이** (header: 길이) — 3~6초 / 10~15초 / 30초 / 60초 이상
2. **들어갈 요소** (header: 요소, multiSelect) — 로고 / 제목·카피 텍스트 / 캐릭터·아이콘 / 숫자·차트
3. **색** (header: 색) — 브랜드 색 있음(알려 주세요) / 흑백·모노톤 / 밝은 파스텔 / 어두운 배경+포인트 색
4. **사운드·마무리** (header: 끝맺음) — 음악 비트에 맞춤 / 사운드 없음 / 무한 루프 / 로고·CTA로 마무리

결과물이 "프롬프트만"이면 3라운드는 길이와 색만 물어도 됩니다.

## 후보표 (느낌 → 스타일, 갤러리를 띄울 수 없을 때 목록을 묶는 용도)

| 느낌 | 후보 |
|---|---|
| 깔끔·신뢰감 | flat-2d, swiss-grid, infographic, geometric-minimal |
| 귀엽고 친근 | rubber-hose, 3d-clay, inflatable, jelly-softbody, clay-stopmotion |
| 힙하고 강렬 | kinetic-type, glitch, paper-collage, duotone-pop |
| 고급·감성 | liquid-morph, glass-3d, chrome-metal, watercolor, line-art |
| 미래적 | neon-cyber, particle-abstract, isometric, parallax-2-5d |
| 레트로 | retro-vhs, pixel-8bit, risograph-grain |
| 3D·입체감 | 3d-clay, glass-3d, 3d-type, inflatable, chrome-metal, low-poly, jelly-softbody, clay-stopmotion, isometric |
| 정보 전달 | infographic, isometric, whiteboard-doodle, ui-motion |

## 스타일표

| id | 한글 이름 | 한 줄 설명 (선택지용) | 영어 키워드 |
|---|---|---|---|
| kinetic-type | 키네틱 타이포 | 글자 자체가 리듬 있게 튀고 늘고 회전 | kinetic typography, bold sans, words animate on beat, scale/rotate/stagger |
| flat-2d | 플랫 2D | 그림자 없는 단색 도형·인물이 깔끔하게 움직임 | flat vector illustration, solid fills, no gradients, clean shape animation |
| line-art | 라인아트 | 선이 스스로 그려지며 장면이 완성 | single-weight line art, stroke draw-on, minimal palette |
| infographic | 인포그래픽 | 아이콘·차트·숫자가 순서대로 등장 | data-driven motion, animated charts, count-up numbers, icon builds |
| whiteboard-doodle | 화이트보드 손그림 | 손으로 그린 듯한 낙서가 슥슥 | hand-drawn doodle, marker texture, boil/jitter lines |
| liquid-morph | 리퀴드 모프 | 액체처럼 흐르며 모양이 변신 | fluid shape morphing, blobby transitions, smooth gradients |
| isometric | 아이소메트릭 | 45° 블록·미니어처 도시가 조립됨 | isometric 2.5D, build-up assembly, pastel blocks |
| 3d-clay | 3D 클레이 | 말랑한 점토가 꾹 눌렸다 튐 | soft clay 3D render, rounded forms, squash and stretch |
| glass-3d | 글래스 3D | 유리 큐브가 빛을 받으며 회전 | frosted glass 3D, refraction, caustics, slow orbit camera |
| clay-stopmotion | 스톱모션 클레이 | 점토 인형이 프레임 단위로 덜컥덜컥 | claymation stop-motion, visible fingerprints, 12fps stepped, handmade set |
| chrome-metal | 크롬·메탈 | 반짝이는 금속 오브젝트 | polished chrome 3D, HDRI reflections, specular sweep, dark studio |
| 3d-type | 3D 타이포 | 두께 있는 글자가 회전 | extruded 3D typography, bevelled letters, camera orbit, soft shadows |
| low-poly | 로우폴리 | 각진 다면체가 회전 | low-poly 3D, flat-shaded facets, faceted gems and terrain |
| inflatable | 인플레이터블 | 풍선처럼 부풀었다 꺼짐 | inflatable 3D, puffy balloon shapes, glossy vinyl, inflate/deflate |
| jelly-softbody | 젤리·소프트바디 | 탱글탱글 출렁임 | soft-body jelly simulation, wobble and jiggle, translucent subsurface |
| paper-collage | 콜라주·컷아웃 | 잡지 조각·종이를 오려 붙인 듯 덜컥덜컥 | paper cut-out collage, stop-motion stepping, torn edges |
| rubber-hose | 러버호스 카툰 | 1930년대 고무팔 캐릭터처럼 출렁 | rubber hose cartoon, bouncy limbs, vintage ink |
| frame-by-frame | 프레임바이프레임 | 한 장씩 그린 손맛 있는 셀 애니 | hand-drawn cel animation, 12fps on twos, organic smears |
| glitch | 글리치 | 화면이 깨지고 RGB가 어긋남 | digital glitch, RGB split, datamosh, scanline jitter |
| retro-vhs | 레트로 VHS | 80~90년대 비디오테이프 질감 | VHS grain, chromatic aberration, tracking lines, warm cast |
| pixel-8bit | 픽셀 8비트 | 게임 도트 그래픽 | pixel art, limited palette, stepped animation |
| neon-cyber | 네온 사이버 | 어둠 속 네온 빛과 HUD | neon glow on dark, HUD elements, cyan/magenta |
| particle-abstract | 파티클 추상 | 수많은 입자가 모였다 흩어짐 | particle systems, abstract forms, assemble/disperse |
| geometric-minimal | 미니멀 기하 | 원·사각·선만으로 정갈하게 | minimal geometric shapes, precise easing, generous negative space |
| swiss-grid | 스위스 그리드 | 격자 위 큰 활자와 블록이 착착 | Swiss grid layout motion, Helvetica-style type, hard cuts |
| duotone-pop | 듀오톤 팝 | 두 가지 강한 색으로 사진·도형이 번쩍 | duotone photo treatment, high contrast, punchy cuts |
| watercolor | 수채화 | 물감이 번지며 장면이 나타남 | watercolor bleed reveals, paper texture, soft edges |
| risograph-grain | 리소그래프 | 거친 인쇄 입자와 어긋난 색판 | risograph grain, misregistered ink layers, limited spot colors |
| ui-motion | UI 모션 | 앱 화면이 매끄럽게 전환·반응 | product UI animation, device mockup, micro-interactions |
| parallax-2-5d | 2.5D 패럴랙스 | 평면 레이어가 깊이감 있게 움직임 | 2.5D parallax layers, camera push, depth of field |

## 유형표 (애니메이션 유형)

| 한글 | 설명 | 영어 |
|---|---|---|
| 페이드·슬라이드 | 서서히 나타나며 밀려 들어옴 | fade and slide in |
| 팝·바운스 | 툭 튀어나와 통통 | scale pop with overshoot |
| 순차 등장 | 요소가 하나씩 차례로 | staggered entrance |
| 라인 드로잉 | 선이 그려짐 | stroke draw-on |
| 마스크 리빌 | 가려진 게 드러남 | mask/wipe reveal |
| 모프 | 모양이 다른 모양으로 변신 | shape morph |
| 키네틱 텍스트 | 글자가 리듬 있게 움직임 | kinetic text |
| 카운트업·차트 | 숫자가 올라가고 그래프가 자람 | number count-up, chart grow |
| 카메라 줌·이동 | 화면이 다가가거나 지나감 | camera push/pan |
| 와이프 전환 | 장면이 쓸려 바뀜 | wipe transition |
| 파티클 | 입자가 모이거나 흩어짐 | particle assemble/disperse |
| 비트 싱크 컷 | 음악 박자에 맞춰 컷 | beat-synced cuts |
| 공유 요소 전환 | UI 요소가 이어지며 화면 전환 | shared element transition |
| 마이크로 인터랙션 | 버튼·아이콘 작은 반응 | micro-interactions |

## 결과 만들기 (추가 질문 없이)

답을 받으면 바로 아래 형식으로 답합니다.

```
**선택 요약**
- 용도 / 비율 / 길이: …
- 스타일: 메인 ○○ (+ 보조 ○○)
- 움직임: …, 템포: …
- 요소·색·마무리: …

**장면 구성 (한글)**
1. 0–2s: …
2. 2–5s: …
…

**English motion prompt**
(5~8문장. 스타일 키워드, 팔레트 hex 2~4개, 비율·fps·길이, 장면별 움직임, 이징(ease-in-out / spring overshoot 등), 전환 방식, 마무리, 피할 것(avoid …)을 반드시 포함)
```

- 브랜드 색을 안 알려 줬으면 스타일에 맞는 hex를 정해 넣고 "원하면 바꿔 드릴게요"라고 한 줄 덧붙입니다.
- 장면 수는 길이에 맞춥니다: 3~6초 1~2장면, 10~15초 3~4장면, 30초 5~6장면, 60초 이상 8장면 안팎.
- 3D 계열 스타일(3d-clay, clay-stopmotion, glass-3d, chrome-metal, 3d-type, low-poly, inflatable, jelly-softbody)은 프롬프트에 재질, 조명(soft key light, HDRI 등), 카메라 움직임을 넣고, Blender·Cinema 4D·Spline 같은 3D 툴이나 AI 영상 생성기에서 쓰면 가장 잘 나온다고 한 줄 알려 줍니다.

## 결과물별 다음 단계

- **프롬프트만**: 위 결과로 끝. 프롬프트를 코드 블록에 넣어 복사하기 쉽게 합니다.
- **HTML 애니메이션**: CSS/SVG/JS 한 파일로 만듭니다(3D는 three.js). 아티팩트·캔버스 기능이 있으면 거기에 게시하고, 없으면 파일로 줍니다. 라인아트 전용 스킬이 있으면 그것을 씁니다.
- **MP4 영상**: 영상 제작 스킬이나 도구(예: `video-making`, `line-art-animation`, Remotion, ffmpeg)가 있으면 위 장면 구성대로 만듭니다. 없으면 HTML 애니메이션을 만들고 화면 녹화 방법을 안내합니다.
- **AE·작업 지시서**: 장면별 레이어, 키프레임 시간, 이징 값(예: cubic-bezier(0.34,1.56,0.64,1)), 필요한 소스 목록을 표로 정리합니다.

## 해석 규칙

- "기타"에 비슷한 말("애플 광고 같은 거", "유리 느낌")이 오면 가장 가까운 스타일 id로 맞추고 어떤 스타일로 읽었는지 한 줄로 알려 줍니다. 특정 브랜드·작품을 그대로 베끼지 않고 그 분위기의 일반 스타일로 바꿉니다.
- 메인 1개는 필수, 보조는 0~1개. 서로 어울리지 않는 조합(예: pixel-8bit + glass-3d)은 한 줄로 이유를 말하고 대안을 제안합니다.
- 질문은 1라운드, 갤러리, 2라운드, 3라운드까지만 합니다. 그 뒤에는 더 묻지 않고 만듭니다.

## 갤러리 HTML

아래 코드 블록의 내용만(펜스 제외) 그대로 사용합니다.

```html
<style>
.g{display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:10px}
.c{position:relative;border:0.5px solid var(--border);border-radius:12px;overflow:hidden;cursor:pointer;background:var(--surface-2);text-align:left;padding:0;font:inherit;color:inherit}
.c.m{outline:3px solid var(--border-accent);outline-offset:-1px}.c.s{outline:3px dashed var(--border-accent);outline-offset:-1px}
.bd{position:absolute;top:8px;left:8px;z-index:3;font-size:12px;font-weight:500;padding:3px 10px;border-radius:999px}
.bd.m{background:#185fa5;color:#fff}.bd.s{background:#fff;color:#185fa5;border:1.5px solid #185fa5}
.stage{position:relative;height:124px;overflow:hidden;display:flex;align-items:center;justify-content:center;text-align:center;line-height:1.1}
.n{padding:7px 10px 9px;font-size:14px;font-weight:500}.n small{display:block;font-size:12px;font-weight:400;color:var(--text-secondary);margin-top:2px}
.L{display:inline-block;white-space:pre}.a{position:absolute}
.lg{font-size:12px;padding:4px 10px}.lg.on{border-color:var(--border-accent);color:var(--text-accent)}
@keyframes pop{0%{transform:scale(0) rotate(-12deg)}15%{transform:scale(1.25) rotate(6deg)}25%,80%{transform:scale(1) rotate(0)}95%,100%{transform:scale(0)}}
@keyframes gl{0%,88%,100%{transform:translate(0)}90%{transform:translate(-5px,2px)}93%{transform:translate(5px,-2px)}96%{transform:translate(-2px,0)}}
@keyframes slice{0%,86%,100%{opacity:0}88%,95%{opacity:1}}
@keyframes drawT{0%{stroke-dashoffset:900;fill:transparent}55%{stroke-dashoffset:0;fill:transparent}70%,92%{stroke-dashoffset:0;fill:#222}100%{stroke-dashoffset:0;fill:transparent}}
@keyframes draw{0%{stroke-dashoffset:400}50%,100%{stroke-dashoffset:0}}
@keyframes sqL{0%,100%{transform:translateY(0) scale(1.15,.85)}40%{transform:translateY(-14px) scale(.92,1.08)}70%{transform:translateY(0) scale(1.05,.95)}}
@keyframes shd{0%,100%{transform:scale(1);opacity:1}40%{transform:scale(.6);opacity:.5}}
@keyframes tilt{0%,100%{transform:rotateY(-28deg) rotateX(10deg)}50%{transform:rotateY(28deg) rotateX(-8deg)}}
@keyframes sheen{0%{background-position:160% 0}100%{background-position:-60% 0}}
@keyframes fl{0%,100%{opacity:1}44%{opacity:.35}47%{opacity:1}52%{opacity:.5}55%{opacity:1}}
@keyframes hard{0%,45%{transform:translateX(-101%)}50%,95%{transform:translateX(0)}100%{transform:translateX(-101%)}}
@keyframes hardT{0%,50%{transform:translateY(24px);opacity:0}55%,95%{transform:translateY(0);opacity:1}100%{opacity:0}}
@keyframes sx{0%,100%{transform:translateX(-30px)}50%{transform:translateX(30px)}}
@keyframes popW{0%{transform:scale(0)}12%{transform:scale(1.15)}20%,85%{transform:scale(1)}100%{transform:scale(0)}}
@keyframes blob{0%,100%{border-radius:40% 60% 60% 40%/50% 40% 60% 50%;transform:rotate(0) scale(1)}50%{border-radius:60% 40% 30% 70%/40% 60% 40% 60%;transform:rotate(180deg) scale(1.15)}}
@keyframes scan{to{background-position:0 12px}}
@keyframes ty{0%{opacity:0}4%,85%{opacity:1}100%{opacity:0}}
@keyframes hop{0%,100%{transform:translateY(0)}50%{transform:translateY(-16px)}}
@keyframes jit{0%{transform:rotate(-2deg) translate(-1px,0)}50%{transform:rotate(1.5deg) translate(1px,-1px)}100%{transform:rotate(-.5deg) translate(0,1px)}}
@keyframes bar{0%,100%{height:6px}50%{height:var(--h)}}
@keyframes inflate{0%,100%{transform:scale(.6,.5)}50%{transform:scale(1.06,1.04)}65%{transform:scale(.97,1)}}
@keyframes jelly{0%,100%{transform:scale(1,1)}20%{transform:scale(1.2,.8)}40%{transform:scale(.88,1.12) skewX(5deg)}60%{transform:scale(1.06,.94) skewX(-3deg)}80%{transform:scale(.98,1.02)}}
@keyframes boil{0%{transform:rotate(-5deg) translateY(0)}33%{transform:rotate(4deg) translateY(-3px)}66%{transform:rotate(-2deg) translateY(1px)}100%{transform:rotate(-5deg)}}
@keyframes flash{0%,49%{background:#ff3d7f}50%,100%{background:#1b1464}}
@keyframes bleed{0%,100%{transform:scale(.4);opacity:.15}60%{transform:scale(1.3);opacity:.55}}
@keyframes fadeT{0%,30%{opacity:0;filter:blur(5px)}55%,90%{opacity:1;filter:blur(0)}100%{opacity:0}}
@keyframes gather{0%,100%{transform:translate(var(--x),var(--y));opacity:.25}45%,55%{transform:translate(0,0);opacity:0}}
@keyframes txtIn{0%,38%{opacity:0;letter-spacing:.6em}52%,88%{opacity:1;letter-spacing:.05em}100%{opacity:0}}
@keyframes mis{0%,100%{transform:translate(0)}50%{transform:translate(4px,3px)}}
@keyframes slideIn{0%,25%{transform:translateY(110%)}40%,90%{transform:translateY(0)}100%{transform:translateY(-110%)}}
@keyframes card{0%,20%{transform:translateY(60px);opacity:0}35%,85%{transform:translateY(0);opacity:1}100%{opacity:0}}
@keyframes px1{to{transform:translateX(-50%)}}
@keyframes rise{0%,100%{transform:translateY(0)}50%{transform:translateY(-8px)}}
@keyframes arm{0%,100%{transform:rotate(-20deg)}50%{transform:rotate(25deg)}}
@keyframes facet{0%,100%{opacity:.55}50%{opacity:1}}
</style>
<h2 class="sr-only">내 글자로 보는 모션그래픽 스타일 30종 갤러리 / Motion graphics style gallery with your own text.</h2>
<div style="display:flex;gap:10px;align-items:flex-end;flex-wrap:wrap;margin-bottom:6px">
  <div style="flex:1;min-width:220px"><label id="tl" for="txt" style="font-size:13px;color:var(--text-secondary)"></label><input id="txt" type="text" maxlength="20" style="width:100%;margin-top:4px"></div>
  <label style="display:flex;align-items:center;gap:6px;font-size:13px;color:var(--text-secondary);padding-bottom:8px"><input type="checkbox" id="hint" checked> <span id="hl"></span></label>
  <div style="display:flex;gap:6px;padding-bottom:4px"><button class="lg" id="lk">한국어</button><button class="lg" id="le">English</button></div>
</div>
<div id="e1" style="font-size:13px;color:var(--text-danger);min-height:16px;margin-bottom:4px"></div>
<div class="g" id="g"></div>
<div style="display:flex;align-items:center;gap:12px;margin-top:14px;flex-wrap:wrap;padding:12px;border-radius:12px;background:var(--bg-neutral)">
  <span id="st" style="font-size:14px"></span>
  <button id="go" style="margin-left:auto"></button>
</div>
<script>
const esc=s=>s.replace(/[&<>"]/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[c]));
const fs=t=>{const n=[...t].length;return n<=4?34:n<=7?27:n<=11?21:n<=15?17:14};
const L=(t,f)=>[...t].map((c,i)=>`<span class="L" style="${f(i)}">${c===' '?' ':esc(c)}</span>`).join('');
const S=(bg,inner,extra='')=>`<div class="stage" style="background:${bg};${extra}">${inner}</div>`;
const RD="ui-rounded,'Arial Rounded MT Bold','Nunito',sans-serif";
const R={
'kinetic-type':t=>S('#fff',`<div style="font-size:${fs(t)}px;font-weight:700">${L(t,i=>`animation:pop 2.6s ${i*.08}s infinite;color:${i%3==1?'#e63946':'#111'}`)}</div>`),
'flat-2d':t=>S('#fdf0d5',`<div class="a" style="left:10%;top:14%;width:40px;height:40px;border-radius:50%;background:#f4a261;animation:sx 3s infinite ease-in-out"></div><div class="a" style="right:10%;bottom:12%;width:28px;height:28px;background:#2a9d8f;animation:sx 3s .6s infinite reverse ease-in-out"></div><div style="position:relative;font-size:${fs(t)}px;font-weight:700;color:#264653;animation:popW 3s infinite">${esc(t)}</div>`),
'line-art':t=>S('#fffdf7',`<svg viewBox="0 0 220 124" width="100%" height="100%"><text x="110" y="70" text-anchor="middle" font-size="${fs(t)}" font-weight="500" fill="none" stroke="#222" stroke-width="1" style="stroke-dasharray:900;animation:drawT 3.4s infinite">${esc(t)}</text><path d="M45 90 Q110 104 175 90" fill="none" stroke="#e63946" stroke-width="2" stroke-linecap="round" style="stroke-dasharray:400;animation:draw 3.4s .8s infinite"/></svg>`),
'infographic':t=>S('#f1f5fb',`<div style="display:flex;align-items:flex-end;gap:10px"><div style="text-align:left"><div style="font-size:${fs(t)-6}px;font-weight:600;color:#0c447c">${esc(t)}</div><div style="font-size:24px;font-weight:700;color:#378add">72%</div></div><div style="display:flex;align-items:flex-end;gap:5px;height:64px">${[44,60,32,52].map((h,i)=>`<div style="width:10px;background:${['#378add','#85b7eb','#185fa5','#b5d4f4'][i]};--h:${h}px;animation:bar 2.4s ${i*.2}s infinite"></div>`).join('')}</div></div>`),
'whiteboard-doodle':t=>S('#fff',`<div style="position:relative"><div style="font-family:'Comic Sans MS','Chalkboard SE','Bradley Hand',cursive;font-size:${fs(t)}px;color:#1d3557;animation:jit .35s steps(2) infinite">${esc(t)}</div><svg class="a" style="left:-6%;bottom:-14px;width:112%;height:16px" viewBox="0 0 200 20" preserveAspectRatio="none"><path d="M2 12 q50 -8 100 0 t96 -2" fill="none" stroke="#e63946" stroke-width="3" stroke-linecap="round" style="stroke-dasharray:400;animation:draw 2.6s infinite"/></svg></div>`),
'liquid-morph':t=>S('#1a1033',`<div class="a" style="width:100px;height:100px;background:linear-gradient(135deg,#c77dff,#ff6fb5);animation:blob 5s infinite ease-in-out"></div><div style="position:relative;font-size:${fs(t)}px;font-weight:600;color:#fff">${esc(t)}</div>`),
'paper-collage':t=>{const P=[['#e76f51','#fff'],['#264653','#fff'],['#e9c46a','#111'],['#fff','#111'],['#2a9d8f','#fff']];return S('#efe6d8',`<div style="font-size:${fs(t)-4}px;font-weight:700">${L(t,i=>`background:${P[i%5][0]};color:${P[i%5][1]};padding:2px 4px;margin:1px;transform:rotate(${[-6,4,-3,7,-5][i%5]}deg);animation:jit .9s ${i*.1}s steps(2) infinite`)}</div>`)},
'rubber-hose':t=>S('#f6e7c1',`<div style="position:relative;animation:hop .7s infinite ease-in-out"><svg class="a" style="left:-30px;top:30%" width="30" height="30" viewBox="0 0 30 30"><path d="M28 10 q-14 -10 -22 6" fill="none" stroke="#222" stroke-width="3" style="transform-origin:28px 10px;animation:arm .7s infinite"/><circle cx="6" cy="18" r="5" fill="#fff" stroke="#222" stroke-width="2"/></svg><div style="font-family:Georgia,serif;font-size:${fs(t)}px;font-weight:700;color:#222;text-shadow:2px 2px 0 #e9c46a">${esc(t)}</div><svg class="a" style="right:-30px;top:30%" width="30" height="30" viewBox="0 0 30 30"><path d="M2 10 q14 -10 22 6" fill="none" stroke="#222" stroke-width="3" style="transform-origin:2px 10px;animation:arm .7s .35s infinite"/><circle cx="24" cy="18" r="5" fill="#fff" stroke="#222" stroke-width="2"/></svg></div>`),
'frame-by-frame':t=>S('#fafafa',`<div style="font-family:'Comic Sans MS','Bradley Hand',cursive;font-size:${fs(t)}px;font-weight:700;color:#fff;-webkit-text-stroke:1.5px #333;text-shadow:3px 3px 0 #ffb703">${L(t,i=>`animation:boil .5s ${(i*.13)%.5}s steps(1,end) infinite`)}</div>`),
'glitch':t=>S('#0a0a0a',`<div style="position:relative;font-size:${fs(t)}px;font-weight:700;color:#fff;animation:gl 1.6s infinite">${esc(t)}<span class="a" style="left:-3px;top:0;color:#ff004c;mix-blend-mode:screen;animation:gl 1.6s .05s infinite">${esc(t)}</span><span class="a" style="left:3px;top:0;color:#00f0ff;mix-blend-mode:screen;animation:gl 1.6s .1s infinite">${esc(t)}</span></div><div class="a" style="left:0;right:0;top:46%;height:6px;background:#fff;mix-blend-mode:difference;animation:slice 1.6s infinite"></div>`),
'retro-vhs':t=>S('#3a2a4a',`<div class="a" style="left:10px;top:8px;font-family:var(--font-mono);font-size:11px;color:#fff">PLAY ▶</div><div style="font-size:${fs(t)}px;font-weight:700;color:#ffd6a5;text-shadow:-2px 0 #ff004c,2px 0 #00f0ff;animation:gl 2.2s infinite">${esc(t)}</div><div class="a" style="inset:0;background:repeating-linear-gradient(0deg,rgba(0,0,0,.22) 0 2px,transparent 2px 6px);animation:scan .4s linear infinite"></div>`),
'pixel-8bit':t=>S('#5c94fc',`<div class="a" style="left:0;right:0;bottom:0;height:16px;background:#c84c0c;border-top:3px solid #e09050"></div><div class="a" style="left:14%;bottom:16px;width:14px;height:14px;background:#e4000f;animation:hop .6s steps(3) infinite"></div><div style="font-family:var(--font-mono);font-size:${fs(t)-6}px;font-weight:700;color:#fff;text-shadow:2px 2px 0 #000">${L(t,i=>`animation:ty 3s ${i*.12}s steps(1,end) infinite`)}</div>`),
'neon-cyber':t=>S('#07070f',`<div class="a" style="left:10px;top:10px;width:16px;height:16px;border-left:2px solid #00f5ff;border-top:2px solid #00f5ff"></div><div class="a" style="right:10px;bottom:10px;width:16px;height:16px;border-right:2px solid #ff2bd6;border-bottom:2px solid #ff2bd6"></div><div style="font-size:${fs(t)}px;font-weight:600;color:#fff;text-shadow:0 0 4px #00f5ff,0 0 10px #00f5ff,0 0 22px #ff2bd6;animation:fl 2.4s infinite">${esc(t)}</div>`),
'particle-abstract':t=>{let d='';for(let i=0;i<16;i++){const a=i/16*6.283,r=80+(i%3)*20;d+=`<i class="a" style="width:4px;height:4px;border-radius:50%;background:${['#9bf6ff','#bdb2ff','#ffc6ff','#fff'][i%4]};--x:${Math.round(Math.cos(a)*r)}px;--y:${Math.round(Math.sin(a)*r*.5)}px;animation:gather 3.4s ${(i%5)*.05}s infinite"></i>`}return S('#0d1321',d+`<div style="position:relative;font-size:${fs(t)}px;font-weight:500;color:#fff;animation:txtIn 3.4s infinite">${esc(t)}</div>`)},
'geometric-minimal':t=>S('#f7f7f5',`<svg class="a" viewBox="0 0 220 124" width="100%" height="100%"><circle cx="110" cy="62" r="48" fill="none" stroke="#e63946" stroke-width="1.5" style="stroke-dasharray:310;animation:draw 3.2s infinite"/></svg><div style="position:relative;overflow:hidden"><div style="font-size:${fs(t)-4}px;letter-spacing:.16em;color:#111;animation:slideIn 3.2s infinite cubic-bezier(.7,0,.3,1)">${esc(t)}</div></div>`),
'swiss-grid':t=>S('#fff',`<div class="a" style="left:0;top:0;width:38%;height:100%;background:#e30613;animation:hard 2.4s steps(1,end) infinite"></div><div class="a" style="left:10px;top:8px;font-size:11px;color:#111">01 —</div><div class="a" style="right:12px;bottom:10px;font-family:Helvetica,Arial,sans-serif;font-size:${fs(t)}px;font-weight:700;color:#111;animation:hardT 2.4s steps(1,end) infinite">${esc(t)}</div>`),
'duotone-pop':t=>S('#ff3d7f',`<div style="font-size:${fs(t)+2}px;font-weight:800;color:#ffe600;animation:popW 1s infinite">${esc(t)}</div>`,'animation:flash 1s infinite'),
'watercolor':t=>S('#fbf8f1',`<div class="a" style="left:18%;top:12%;width:80px;height:80px;border-radius:50%;background:#90caf9;filter:blur(7px);animation:bleed 3.6s infinite"></div><div class="a" style="right:16%;bottom:8%;width:70px;height:70px;border-radius:50%;background:#f8bbd0;filter:blur(7px);animation:bleed 3.6s 1.2s infinite"></div><div style="position:relative;font-family:Georgia,serif;font-size:${fs(t)}px;color:#3d5a80;animation:fadeT 3.6s infinite">${esc(t)}</div>`),
'risograph-grain':t=>S('#f4efe6',`<div style="position:relative;font-size:${fs(t)+2}px;font-weight:800"><span style="color:#ff48b0;mix-blend-mode:multiply">${esc(t)}</span><span class="a" style="left:0;top:0;color:#0078bf;mix-blend-mode:multiply;opacity:.85;animation:mis 1s steps(2) infinite">${esc(t)}</span></div><div class="a" style="inset:0;background:repeating-radial-gradient(circle at 30% 40%,rgba(0,0,0,.05) 0 1px,transparent 1px 3px)"></div>`),
'ui-motion':t=>S('#eef0f4',`<div style="width:86px;height:112px;margin-top:22px;border-radius:14px;background:#fff;border:1px solid #c9ced8;padding:8px;box-sizing:border-box;overflow:hidden"><div style="border-radius:8px;background:#378add;color:#fff;font-size:${Math.min(fs(t)-10,14)}px;font-weight:600;padding:8px 6px;animation:card 3s infinite cubic-bezier(.2,.8,.2,1)">${esc(t)}</div><div style="height:8px;border-radius:3px;background:#e6f1fb;margin-top:6px;animation:card 3s .15s infinite"></div><div style="height:8px;width:70%;border-radius:3px;background:#e6f1fb;margin-top:5px;animation:card 3s .3s infinite"></div></div>`),
'parallax-2-5d':t=>S('#ffd6a5',`<div class="a" style="left:0;bottom:30px;width:200%;height:30px;background:repeating-linear-gradient(90deg,#e9a178 0 40px,transparent 40px 80px);animation:px1 9s linear infinite"></div><div class="a" style="left:0;bottom:0;width:200%;height:24px;background:repeating-linear-gradient(90deg,#6d597a 0 30px,#b56576 30px 60px);animation:px1 3s linear infinite"></div><div style="position:relative;margin-top:-20px;font-size:${fs(t)}px;font-weight:700;color:#355070;text-shadow:0 4px 8px rgba(0,0,0,.15);animation:rise 3s infinite ease-in-out">${esc(t)}</div>`),
'isometric':t=>S('#e8f4f0',`<div style="perspective:500px"><div style="transform:rotateX(50deg) rotateZ(-35deg);transform-style:preserve-3d;animation:rise 2.4s infinite ease-in-out"><div style="padding:8px 14px;background:#5dcaa5;color:#04342c;font-size:${fs(t)-4}px;font-weight:800;box-shadow:0 1px 0 #1d9e75,1px 2px 0 #1d9e75,2px 3px 0 #1d9e75,3px 4px 0 #1d9e75,4px 5px 0 #0f6e56,5px 6px 0 #0f6e56,6px 7px 0 #0f6e56">${esc(t)}</div></div></div>`),
'3d-clay':t=>S('#f6e6d8',`<div class="a" style="bottom:18px;left:50%;width:60%;height:10px;margin-left:-30%;border-radius:50%;background:rgba(110,50,30,.22);animation:shd 1.3s infinite ease-in-out"></div><div style="font-family:${RD};font-size:${fs(t)+2}px;font-weight:800">${L(t,i=>`color:#ff8fab;text-shadow:0 2px 0 #ec6f8f,0 4px 0 #d85b7d,0 6px 0 #c24c6c,0 12px 8px rgba(120,20,50,.28);transform-origin:50% 100%;animation:sqL 1.3s ${i*.09}s infinite ease-in-out`)}</div>`),
'clay-stopmotion':t=>S('#e9dcc8',`<div class="a" style="left:0;right:0;bottom:0;height:24px;background:#b9a27f"></div><div style="position:relative;font-family:${RD};font-size:${fs(t)}px;font-weight:800">${L(t,i=>`color:#f59a3c;text-shadow:0 2px 0 #d9781f,0 4px 0 #b35f12,0 8px 6px rgba(90,40,0,.3);animation:boil .6s ${(i*.17)%.6}s steps(1,end) infinite`)}</div>`),
'glass-3d':t=>S('#0f1c2e',`<div class="a" style="left:14%;top:10%;width:60px;height:60px;border-radius:50%;background:radial-gradient(circle at 35% 30%,#ffb199,#ff7a59 50%,#c4431f);animation:sx 6s infinite ease-in-out"></div><div class="a" style="right:12%;bottom:8%;width:46px;height:46px;border-radius:50%;background:radial-gradient(circle at 35% 30%,#b8ecff,#4cc9f0 50%,#1f7fa8);animation:sx 7s infinite reverse ease-in-out"></div><div style="perspective:400px"><div style="padding:12px 18px;border-radius:14px;background:rgba(255,255,255,.16);border:1px solid rgba(255,255,255,.55);backdrop-filter:blur(8px);-webkit-backdrop-filter:blur(8px);color:#fff;font-size:${fs(t)-2}px;font-weight:600;animation:tilt 5s infinite ease-in-out">${esc(t)}</div></div>`),
'chrome-metal':t=>S('radial-gradient(circle at 50% 120%,#3a3a44,#0e0e12 70%)',`<div style="position:relative;font-size:${fs(t)+2}px;font-weight:800"><span style="background:linear-gradient(180deg,#fff 0%,#dcdce3 28%,#6b6b75 50%,#f2f2f5 64%,#9a9aa2 100%);-webkit-background-clip:text;background-clip:text;color:transparent">${esc(t)}</span><span class="a" style="left:0;top:0;background:linear-gradient(105deg,transparent 40%,rgba(255,255,255,.95) 50%,transparent 60%);background-size:250% 100%;-webkit-background-clip:text;background-clip:text;color:transparent;animation:sheen 2.4s infinite">${esc(t)}</span></div>`),
'3d-type':t=>S('#fff4e6',`<div style="perspective:260px"><div style="font-size:${fs(t)+4}px;font-weight:800;color:#ff6b6b;text-shadow:1px 1px 0 #e05555,2px 2px 0 #d24c4c,3px 3px 0 #c44343,4px 4px 0 #b63a3a,5px 5px 0 #a83232,6px 6px 0 #9a2a2a,9px 12px 10px rgba(0,0,0,.25);animation:tilt 3s infinite ease-in-out">${esc(t)}</div></div>`),
'low-poly':t=>S('#eaf3de',`<svg class="a" viewBox="0 0 220 124" width="100%" height="100%" preserveAspectRatio="none">${[[0,0,70,0,30,60,'#c0dd97'],[70,0,150,0,110,55,'#97c459'],[150,0,220,0,190,64,'#c0dd97'],[0,0,30,60,0,124,'#97c459'],[30,60,110,55,60,124,'#639922'],[110,55,190,64,150,124,'#3b6d11'],[190,64,220,0,220,124,'#639922'],[0,124,30,60,60,124,'#3b6d11'],[60,124,110,55,150,124,'#97c459'],[150,124,190,64,220,124,'#27500a']].map((p,i)=>`<polygon points="${p.slice(0,6).join(',')}" fill="${p[6]}" style="animation:facet 3s ${i*.3}s infinite"/>`).join('')}</svg><div style="position:relative;font-size:${fs(t)}px;font-weight:800;color:#fff;text-shadow:2px 2px 0 #173404">${esc(t)}</div>`),
'inflatable':t=>S('#e6f1fb',`<div style="font-family:${RD};font-size:${fs(t)+4}px;font-weight:900">${L(t,i=>`color:#5bb8f2;text-shadow:0 -2px 0 #d9f3ff,0 3px 0 #2f8fd1,0 6px 0 #1d6aa3,0 12px 10px rgba(10,50,100,.3);animation:inflate 2s ${i*.08}s infinite ease-in-out`)}</div>`),
'jelly-softbody':t=>S('#fbeaf0',`<div class="a" style="bottom:20px;left:50%;width:60%;height:8px;margin-left:-30%;border-radius:50%;background:rgba(60,120,40,.2)"></div><div style="font-family:${RD};font-size:${fs(t)+4}px;font-weight:900;color:rgba(110,190,40,.9);text-shadow:0 3px 0 rgba(60,120,20,.7),0 0 16px rgba(190,240,150,.9);transform-origin:50% 100%;animation:jelly 1.5s infinite">${esc(t)}</div>`)
};
const D=[['kinetic-type','키네틱 타이포','가사 영상, 숏폼 광고 오프닝','Kinetic typography','lyric videos, short-form ad openers'],['flat-2d','플랫 2D','앱 사용법, 서비스 소개 영상','Flat 2D','app how-tos, product explainers'],['line-art','라인아트','미니멀 브랜드 인트로','Line art','minimal brand intros'],['infographic','인포그래픽','뉴스·리포트, 실적 발표 영상','Infographic','news, reports, earnings videos'],['whiteboard-doodle','화이트보드 손그림','유튜브 지식 채널, 온라인 강의','Whiteboard doodle','explainer channels, online courses'],['liquid-morph','리퀴드 모프','음악 앱·뷰티 브랜드 광고','Liquid morph','music apps, beauty brand ads'],['paper-collage','콜라주·컷아웃','패션·아트 매거진 SNS','Paper collage','fashion and art magazine socials'],['rubber-hose','러버호스 카툰','옛날 만화풍 브랜드 캠페인','Rubber hose cartoon','vintage-cartoon brand campaigns'],['frame-by-frame','프레임바이프레임','손그림 애니 뮤비, 인디 광고','Frame-by-frame','hand-drawn music videos, indie ads'],['glitch','글리치','게임·테크 티저, 힙합 뮤비','Glitch','game and tech teasers, hip-hop videos'],['retro-vhs','레트로 VHS','레트로 뮤비, 빈티지 숍 릴스','Retro VHS','retro music videos, vintage shop reels'],['pixel-8bit','픽셀 8비트','게임 런칭, 레트로 이벤트 공지','Pixel 8-bit','game launches, retro event promos'],['neon-cyber','네온 사이버','게임·e스포츠, 나이트 이벤트','Neon cyber','gaming, esports, night events'],['particle-abstract','파티클 추상','테크 컨퍼런스 오프닝','Particle abstract','tech conference openers'],['geometric-minimal','미니멀 기하','디자인 에이전시 로고 리빌','Geometric minimal','design agency logo reveals'],['swiss-grid','스위스 그리드','디자인 전시, 테크 기업 발표','Swiss grid','design shows, tech keynotes'],['duotone-pop','듀오톤 팝','음악 페스티벌, 스트리트 브랜드 릴스','Duotone pop','music festivals, streetwear reels'],['watercolor','수채화','웨딩·여행 브이로그 인트로','Watercolor','wedding and travel vlog intros'],['risograph-grain','리소그래프','독립출판, 카페·전시 포스터','Risograph','zines, café and exhibition posters'],['ui-motion','UI 모션','앱 출시 광고, 기능 소개','UI motion','app launch ads, feature tours'],['parallax-2-5d','2.5D 패럴랙스','여행·게임 타이틀 화면','2.5D parallax','travel and game title screens'],['isometric','아이소메트릭','스타트업 서비스 소개','Isometric','startup product explainers'],['3d-clay','3D 클레이','귀여운 캐릭터 광고, 생활 앱 SNS','3D clay','cute character ads, lifestyle app socials'],['clay-stopmotion','스톱모션 클레이','어린이 콘텐츠, 손맛 캠페인','Claymation','kids content, handmade campaigns'],['glass-3d','글래스 3D','핀테크·AI 서비스 소개','Glass 3D','fintech and AI product videos'],['chrome-metal','크롬·메탈','전자기기 런칭, Y2K 패션 브랜드','Chrome / metal','gadget launches, Y2K fashion'],['3d-type','3D 타이포','유튜브 채널 오프닝, 이벤트 타이틀','3D typography','channel openers, event titles'],['low-poly','로우폴리','게임·아웃도어 브랜드','Low-poly','game and outdoor brands'],['inflatable','인플레이터블','장난감·음료 브랜드 숏폼','Inflatable','toy and drink brand shorts'],['jelly-softbody','젤리·소프트바디','디저트·뷰티 신제품 숏폼','Jelly / soft-body','dessert and beauty launch shorts']];
const T={ko:{tl:'영상에 들어갈 글자를 써 보세요',ph:'오늘의 커피',hl:'"이런 데서 봤죠?" 힌트',seen:'이런 데서 봤죠? ',m:'메인',s:'보조',hint0:'카드를 누르면 <b style="font-weight:500">메인</b>, 하나 더 누르면 <b style="font-weight:500">보조</b>로 표시돼요.',opt:' · 보조는 선택 사항이에요',go0:'이 스타일로 진행 ↗',go:(a,b)=>`${a}${b?' + '+b:''}(으)로 진행 ↗`,err:'카드를 하나 눌러 메인 스타일을 먼저 골라 주세요.'},
en:{tl:'Type the words for your video',ph:'Morning Coffee',hl:'"Seen it in" hints',seen:'Seen in: ',m:'Main',s:'Accent',hint0:'Click a card for the <b style="font-weight:500">main</b> style, another for an <b style="font-weight:500">accent</b>.',opt:' · accent is optional',go0:'Continue with this style ↗',go:(a,b)=>`Continue with ${a}${b?' + '+b:''} ↗`,err:'Pick a main style first by clicking a card.'}};
const $=id=>document.getElementById(id);let m=null,s=null;
let G=(document.documentElement.lang||navigator.language||'ko').toLowerCase().startsWith('ko')?'ko':'en';
const nm=id=>{const d=D.find(x=>x[0]===id);return G==='ko'?d[1]:d[3]};
const txt=()=>$('txt').value.trim()||T[G].ph;
function render(){const t=txt(),h=$('hint').checked,X=T[G];$('g').innerHTML=D.map(d=>{const id=d[0],k=G==='ko'?d[1]:d[3],ht=G==='ko'?d[2]:d[4];return `<button class="c${id===m?' m':id===s?' s':''}" data-id="${id}">${id===m?`<span class="bd m">${X.m} ✓</span>`:id===s?`<span class="bd s">${X.s} ✓</span>`:''}${R[id](t)}<div class="n">${k}${h?`<small>${X.seen}${ht}</small>`:''}</div></button>`}).join('');paint()}
function paint(){const X=T[G];$('st').innerHTML=m?`<b style="font-weight:500">${X.m}</b> ${nm(m)}${s?` · <b style="font-weight:500">${X.s}</b> ${nm(s)}`:X.opt}`:X.hint0;$('go').textContent=m?X.go(nm(m),s?nm(s):''):X.go0}
function lang(l){G=l;const X=T[G];$('tl').textContent=X.tl;$('txt').placeholder=X.ph;$('hl').textContent=X.hl;$('lk').classList.toggle('on',G==='ko');$('le').classList.toggle('on',G==='en');$('e1').textContent='';render()}
$('g').addEventListener('click',e=>{const c=e.target.closest('.c');if(!c)return;const id=c.dataset.id;if(id===m){m=s;s=null}else if(id===s){s=null}else if(!m){m=id}else{s=id}render()});
$('txt').addEventListener('input',()=>{$('e1').textContent='';render()});$('hint').addEventListener('change',render);
$('lk').addEventListener('click',()=>lang('ko'));$('le').addEventListener('click',()=>lang('en'));
$('go').addEventListener('click',()=>{if(!m){$('e1').textContent=T[G].err;return}const t=txt(),D0=D.find(x=>x[0]===m),D1=s?D.find(x=>x[0]===s):null;sendPrompt(G==='ko'?`모션 스타일 선택 → 메인: ${m} (${D0[1]}), 보조: ${s?s+' ('+D1[1]+')':'없음'} · 글자: "${t}"`:`Motion style picked → main: ${m} (${D0[3]}), accent: ${s?s+' ('+D1[3]+')':'none'} · text: "${t}"`)});
lang(G);
</script>
```
