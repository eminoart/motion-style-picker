---
name: motion-style-picker
description: "Motion graphics style picker for when you don't know the style name. 모션그래픽 스타일 이름을 모르겠어? 모션그래픽 스타일이름 모를 때, 모션 그래픽 스타일 추천. I don't know the name of the motion graphics style / animation style. Shows an animated preview gallery of 30 motion styles (kinetic typography, isometric, glitch, liquid morph, 3D clay, claymation, glass, chrome, low-poly, inflatable, line art...) in English or Korean, asks multiple-choice questions on purpose, animation type and tempo, then writes a scene breakdown and an English motion prompt. 움직이는 미리보기 갤러리 30종을 보고 고르면 장면 구성과 영어 모션 프롬프트를 만들어 줍니다. Use when: 모션그래픽 스타일 이름 모름, 애니메이션 스타일 고르기, 3D 클레이 애니메이션, 영상 멋지게, 로고 인트로, 설명 영상, 숏폼 광고, motion design style, animation style picker, make my video look cool."
---

# Motion Style Picker

사람들은 모션그래픽 스타일 이름(키네틱 타이포, 아이소메트릭, 러버호스…)을 몰라서 "영상 멋지게", "움직이게"라고만 말합니다. 이 스킬은 객관식으로 용도를 묻고, **실제로 움직이는 미리보기 갤러리**로 스타일을 고르게 하고, 다시 객관식으로 움직임과 세부 사항을 정한 뒤, 그대로 재현할 수 있는 프롬프트를 만듭니다.

People rarely know motion-style names. This skill asks a few multiple-choice questions, shows an animated gallery so the user picks by sight, then produces a scene breakdown and a ready-to-paste English motion prompt. Reply in the user's language.

## 파일 구성 / Files

- `SKILL.md` : 진행 순서와 스타일·유형 데이터, 맨 아래 갤러리 HTML (이 파일만 있어도 동작)
- `assets/gallery.html` : 브라우저에서 바로 열 수 있는 독립 실행판 갤러리

## 질문 방법

- `AskUserQuestion` 도구가 있으면 그것으로 묻습니다. 한 번에 최대 4문항, 문항당 2~4개 선택지. "기타"는 자동으로 붙으므로 직접 넣지 않습니다.
- 도구가 없으면 같은 질문을 번호 목록으로 보여 주고 "1-B, 2-A처럼 답해 주세요"라고 안내합니다. 이때는 선택지를 4개보다 많이 보여 줘도 됩니다.
- 사용자가 이미 대화에서 말한 항목(예: "유튜브 쇼츠용")은 묻지 않고 건너뜁니다.
- 선택지마다 짧은 설명(description)을 붙여 이름을 몰라도 고를 수 있게 합니다.

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

When the gallery button is pressed in English, the message looks like `Motion style picked → main: 3d-clay (3D clay), accent: none`. Treat it the same as the Korean message. Write the summary and scene breakdown in English for English users.

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
4. 위젯 뒤에는 사용자 언어로 이렇게 안내합니다(영어: "Click one card for the main style and a second for an optional accent, then press Continue."). "첫 번째로 누른 카드가 메인 스타일, 두 번째로 누른 카드가 보조 스타일이에요(보조는 선택 사항). 다 고른 뒤 '이 스타일로 진행' 버튼을 눌러 주세요."
5. 버튼을 누르면 `모션 스타일 선택 → 메인: kinetic-type (키네틱 타이포), 보조: glitch (글리치)` 같은 메시지가 들어옵니다(영어 화면이면 `Motion style picked → main: …`). 이 메시지가 오면 바로 2라운드로 넘어갑니다.

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

## 결과물별 다음 단계

- **프롬프트만**: 위 결과로 끝. 프롬프트를 코드 블록에 넣어 복사하기 쉽게 합니다.
- **HTML 애니메이션**: CSS/SVG/JS 한 파일로 만듭니다. 아티팩트·캔버스 기능이 있으면 거기에 게시하고, 없으면 파일로 줍니다. 라인아트 전용 스킬이 있으면 그것을 씁니다.
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
.g{display:grid;grid-template-columns:repeat(auto-fit,minmax(150px,1fr));gap:10px}
.c{border:0.5px solid var(--border);border-radius:12px;overflow:hidden;cursor:pointer;background:var(--surface-2);text-align:left;padding:0;font:inherit;color:inherit}
.c.m{outline:2px solid var(--border-accent)}.c.s{outline:2px dashed var(--border-accent)}
.p{height:84px;position:relative;overflow:hidden}
.n{padding:6px 10px 8px;font-size:13px}.n small{display:block;font-size:11px;color:var(--text-secondary)}
.a{position:absolute}
@keyframes pop{0%,100%{transform:scale(.6) rotate(-8deg)}50%{transform:scale(1.15) rotate(4deg)}}
@keyframes sx{0%,100%{transform:translateX(-30px)}50%{transform:translateX(30px)}}
@keyframes draw{0%{stroke-dashoffset:300}60%,100%{stroke-dashoffset:0}}
@keyframes bar{0%,100%{height:8px}50%{height:50px}}
@keyframes blob{0%,100%{border-radius:40% 60% 60% 40%/50% 40% 60% 50%;transform:rotate(0)}50%{border-radius:60% 40% 30% 70%/40% 60% 40% 60%;transform:rotate(180deg)}}
@keyframes spin{to{transform:rotate(360deg)}}
@keyframes jit{0%{transform:rotate(-6deg) translate(-4px,0)}50%{transform:rotate(5deg) translate(4px,-3px)}100%{transform:rotate(-2deg) translate(0,3px)}}
@keyframes gl{0%,90%,100%{transform:translate(0)}92%{transform:translate(-5px,2px)}95%{transform:translate(5px,-2px)}}
@keyframes scan{to{background-position:0 12px}}
@keyframes hop{0%,100%{transform:translateY(0)}50%{transform:translateY(-20px)}}
@keyframes fl{0%,100%{opacity:1}45%{opacity:.3}50%{opacity:1}55%{opacity:.4}}
@keyframes gather{0%,100%{transform:translate(var(--x),var(--y));opacity:.3}50%{transform:translate(0,0);opacity:1}}
@keyframes flash{0%,49%{background:#ff3d7f}50%,100%{background:#1b1464}}
@keyframes bleed{0%,100%{transform:scale(.4);opacity:.2}60%{transform:scale(1.3);opacity:.6}}
@keyframes mis{0%,100%{transform:translate(0)}50%{transform:translate(4px,3px)}}
@keyframes card{0%,100%{transform:translateY(40px);opacity:0}30%,70%{transform:translateY(0);opacity:1}}
@keyframes px1{to{transform:translateX(-50%)}}
.cu{position:absolute;top:var(--t);width:22px;height:22px;transform-style:preserve-3d}.cu i,.f{position:absolute;inset:0;display:block}
.f{background:linear-gradient(135deg,rgba(255,255,255,.55),rgba(255,255,255,.08) 60%);border:1px solid rgba(255,255,255,.75)}
@keyframes rt{0%,100%{top:var(--t)}50%{top:calc(var(--t) - 10px)}}
@keyframes shd{0%,100%{transform:scale(1);opacity:1}50%{transform:scale(.6);opacity:.45}}
@keyframes sq2{0%,100%{transform:translateY(0) scale(1.18,.82)}20%{transform:translateY(0) scale(.95,1.05)}50%{transform:translateY(-24px) scale(.94,1.06)}80%{transform:translateY(0) scale(1.05,.95)}}
@keyframes boil{0%,100%{transform:translateX(-30px) rotate(-4deg);border-radius:48% 52% 40% 44%/55% 50% 45% 45%}25%{transform:translateX(-10px) rotate(3deg);border-radius:52% 46% 44% 40%/50% 56% 44% 46%}50%{transform:translateX(10px) rotate(-3deg);border-radius:46% 54% 42% 46%/56% 50% 46% 44%}75%{transform:translateX(30px) rotate(4deg);border-radius:50% 48% 46% 42%/52% 54% 44% 46%}}
@keyframes cube{from{transform:rotateX(-22deg) rotateY(0)}to{transform:rotateX(-22deg) rotateY(360deg)}}
@keyframes sheen{0%{background-position:150% 0}100%{background-position:-100% 0}}
@keyframes tilt{0%,100%{transform:rotateY(-28deg) rotateX(8deg)}50%{transform:rotateY(28deg) rotateX(-6deg)}}
@keyframes spinY{to{transform:rotateY(360deg)}}
@keyframes inflate{0%,100%{transform:scale(.72,.6)}55%{transform:scale(1.06,1.04)}70%{transform:scale(.98,1)}}
@keyframes jelly{0%,100%{transform:scale(1,1)}20%{transform:scale(1.18,.82)}40%{transform:scale(.88,1.12) skewX(4deg)}60%{transform:scale(1.06,.94) skewX(-3deg)}80%{transform:scale(.98,1.02)}}
</style>
<h2 class="sr-only">모션그래픽 스타일 30종 미리보기 갤러리 / Animated gallery of 30 motion graphics styles.</h2>
<div style="display:flex;justify-content:flex-end;gap:6px;margin-bottom:8px"><button id="lk" style="font-size:12px;padding:4px 10px">한국어</button><button id="le" style="font-size:12px;padding:4px 10px">English</button></div>
<div class="g" id="g">
<button class="c" data-id="kinetic-type" data-e="Kinetic typography" data-ed="Letters bounce to the beat" data-kd="글자가 리듬 타며 튐" data-k="키네틱 타이포"><div class="p" style="background:#fff;display:flex;align-items:center;justify-content:center;gap:4px;font-weight:500;font-size:22px;color:#111"><span style="display:inline-block;animation:pop 1.2s infinite">MO</span><span style="display:inline-block;animation:pop 1.2s .2s infinite;color:#e63946">VE</span></div><div class="n">키네틱 타이포<small>글자가 리듬 타며 튐</small></div></button>
<button class="c" data-id="flat-2d" data-e="Flat 2D" data-ed="Clean solid-colour shapes" data-kd="단색 도형이 깔끔하게" data-k="플랫 2D"><div class="p" style="background:#fdf0d5"><div class="a" style="left:55px;top:22px;width:40px;height:40px;border-radius:50%;background:#f4a261;animation:sx 2s infinite"></div><div class="a" style="left:70px;top:46px;width:28px;height:28px;background:#2a9d8f;animation:sx 2s .5s infinite reverse"></div></div><div class="n">플랫 2D<small>단색 도형이 깔끔하게</small></div></button>
<button class="c" data-id="line-art" data-e="Line art" data-ed="Lines draw themselves" data-kd="선이 스스로 그려짐" data-k="라인아트"><div class="p" style="background:#fffdf7"><svg viewBox="0 0 160 84" width="100%" height="84"><path d="M20 60 Q50 10 80 45 T140 30" fill="none" stroke="#222" stroke-width="2" stroke-dasharray="300" style="animation:draw 2.4s infinite"/><circle cx="80" cy="45" r="12" fill="none" stroke="#222" stroke-width="2" stroke-dasharray="300" style="animation:draw 2.4s .4s infinite"/></svg></div><div class="n">라인아트<small>선이 스스로 그려짐</small></div></button>
<button class="c" data-id="infographic" data-e="Infographic" data-ed="Charts and numbers build up" data-kd="차트·숫자가 차례로" data-k="인포그래픽"><div class="p" style="background:#f1f5fb;display:flex;align-items:flex-end;justify-content:center;gap:8px;padding-bottom:12px;box-sizing:border-box"><div style="width:14px;background:#378add;animation:bar 2s infinite"></div><div style="width:14px;background:#85b7eb;animation:bar 2s .3s infinite"></div><div style="width:14px;background:#185fa5;animation:bar 2s .6s infinite"></div><div style="font-size:20px;font-weight:500;color:#0c447c;margin-left:8px;align-self:center">72%</div></div><div class="n">인포그래픽<small>차트·숫자가 차례로</small></div></button>
<button class="c" data-id="whiteboard-doodle" data-e="Whiteboard doodle" data-ed="Hand-drawn sketches" data-kd="손낙서가 슥슥" data-k="화이트보드 손그림"><div class="p" style="background:#fff"><svg viewBox="0 0 160 84" width="100%" height="84" style="animation:jit .3s steps(2) infinite"><path d="M30 55 L50 25 L70 55 Z M95 30 q15 -10 30 5 q-5 20 -25 15 q-15 -10 -5 -20" fill="none" stroke="#1d3557" stroke-width="3" stroke-linecap="round" stroke-dasharray="300" style="animation:draw 2.6s infinite"/></svg></div><div class="n">화이트보드 손그림<small>손낙서가 슥슥</small></div></button>
<button class="c" data-id="liquid-morph" data-e="Liquid morph" data-ed="Flows and shape-shifts" data-kd="액체처럼 흐르며 변신" data-k="리퀴드 모프"><div class="p" style="background:#1a1033;display:flex;align-items:center;justify-content:center"><div style="width:56px;height:56px;background:#c77dff;animation:blob 4s infinite ease-in-out"></div></div><div class="n">리퀴드 모프<small>액체처럼 흐르며 변신</small></div></button>
<button class="c" data-id="paper-collage" data-e="Paper collage" data-ed="Cut-out, stop-motion feel" data-kd="오려 붙인 듯 덜컥" data-k="콜라주·컷아웃"><div class="p" style="background:#efe6d8"><div class="a" style="left:30px;top:16px;width:50px;height:34px;background:#e76f51;animation:jit .8s steps(3) infinite"></div><div class="a" style="left:70px;top:34px;width:56px;height:30px;background:#264653;animation:jit .8s .2s steps(3) infinite"></div><div class="a" style="left:60px;top:10px;font-size:15px;font-weight:500;color:#111;background:#fff;padding:2px 4px;animation:jit .8s .4s steps(3) infinite">CUT</div></div><div class="n">콜라주·컷아웃<small>오려 붙인 듯 덜컥</small></div></button>
<button class="c" data-id="rubber-hose" data-e="Rubber hose cartoon" data-ed="Bouncy 1930s limbs" data-kd="고무팔 출렁 캐릭터" data-k="러버호스 카툰"><div class="p" style="background:#f6e7c1"><svg viewBox="0 0 160 84" width="100%" height="84"><g style="animation:hop .6s infinite ease-in-out;transform-origin:80px 50px"><circle cx="80" cy="42" r="16" fill="#222"/><circle cx="74" cy="38" r="4" fill="#fff"/><circle cx="86" cy="38" r="4" fill="#fff"/><path d="M64 46 q-14 -12 -18 4 M96 46 q14 -12 18 4" fill="none" stroke="#222" stroke-width="3"/></g></svg></div><div class="n">러버호스 카툰<small>고무팔 출렁 캐릭터</small></div></button>
<button class="c" data-id="frame-by-frame" data-e="Frame-by-frame" data-ed="Hand-drawn cel animation" data-kd="한 장씩 그린 손맛" data-k="프레임바이프레임"><div class="p" style="background:#fafafa;display:flex;align-items:center;justify-content:center"><div style="width:44px;height:44px;border:3px solid #333;border-radius:45% 55% 50% 50%;animation:jit .5s steps(4) infinite"></div></div><div class="n">프레임바이프레임<small>한 장씩 그린 손맛</small></div></button>
<button class="c" data-id="glitch" data-e="Glitch" data-ed="Broken screen, RGB split" data-kd="깨지고 어긋나는 화면" data-k="글리치"><div class="p" style="background:#0a0a0a;display:flex;align-items:center;justify-content:center;font-size:24px;font-weight:500"><span style="position:relative;color:#fff;animation:gl 1.5s infinite">ERROR<span class="a" style="left:-3px;top:0;color:#ff004c;opacity:.8;animation:gl 1.5s .05s infinite">ERROR</span><span class="a" style="left:3px;top:0;color:#00f0ff;opacity:.8;animation:gl 1.5s .1s infinite">ERROR</span></span></div><div class="n">글리치<small>깨지고 어긋나는 화면</small></div></button>
<button class="c" data-id="retro-vhs" data-e="Retro VHS" data-ed="Videotape texture" data-kd="비디오테이프 질감" data-k="레트로 VHS"><div class="p" style="background:#3a2a4a;display:flex;align-items:center;justify-content:center"><span style="color:#ffd6a5;font-size:18px;font-family:var(--font-mono)">PLAY ▶</span><div class="a" style="inset:0;background:repeating-linear-gradient(0deg,rgba(0,0,0,.25) 0 2px,transparent 2px 6px);animation:scan .4s linear infinite"></div></div><div class="n">레트로 VHS<small>비디오테이프 질감</small></div></button>
<button class="c" data-id="pixel-8bit" data-e="Pixel 8-bit" data-ed="Game pixel art" data-kd="게임 도트 그래픽" data-k="픽셀 8비트"><div class="p" style="background:#5c94fc;display:flex;align-items:flex-end;justify-content:center"><div style="width:24px;height:24px;background:#e4000f;margin-bottom:16px;animation:hop .6s steps(4) infinite"></div><div class="a" style="bottom:0;left:0;right:0;height:16px;background:#c84c0c"></div></div><div class="n">픽셀 8비트<small>게임 도트 그래픽</small></div></button>
<button class="c" data-id="neon-cyber" data-e="Neon cyber" data-ed="Neon and HUD on dark" data-kd="어둠 속 네온·HUD" data-k="네온 사이버"><div class="p" style="background:#07070f;display:flex;align-items:center;justify-content:center"><div style="width:70px;height:40px;border:2px solid #00f5ff;animation:fl 2s infinite"></div><div class="a" style="width:90px;height:2px;background:#ff2bd6;animation:sx 2s infinite"></div></div><div class="n">네온 사이버<small>어둠 속 네온·HUD</small></div></button>
<button class="c" data-id="particle-abstract" data-e="Particle abstract" data-ed="Particles gather and scatter" data-kd="입자가 모였다 흩어짐" data-k="파티클 추상"><div class="p" style="background:#0d1321;display:flex;align-items:center;justify-content:center"><i class="a" style="width:5px;height:5px;border-radius:50%;background:#9bf6ff;--x:-50px;--y:-25px;animation:gather 2.4s infinite"></i><i class="a" style="width:5px;height:5px;border-radius:50%;background:#bdb2ff;--x:45px;--y:-20px;animation:gather 2.4s .1s infinite"></i><i class="a" style="width:5px;height:5px;border-radius:50%;background:#ffc6ff;--x:-40px;--y:25px;animation:gather 2.4s .2s infinite"></i><i class="a" style="width:5px;height:5px;border-radius:50%;background:#9bf6ff;--x:55px;--y:22px;animation:gather 2.4s .3s infinite"></i><i class="a" style="width:5px;height:5px;border-radius:50%;background:#fff;--x:0px;--y:-32px;animation:gather 2.4s .15s infinite"></i><i class="a" style="width:5px;height:5px;border-radius:50%;background:#fff;--x:5px;--y:32px;animation:gather 2.4s .25s infinite"></i></div><div class="n">파티클 추상<small>입자가 모였다 흩어짐</small></div></button>
<button class="c" data-id="geometric-minimal" data-e="Geometric minimal" data-ed="Just circles and lines" data-kd="원·선만으로 정갈" data-k="미니멀 기하"><div class="p" style="background:#f7f7f5;display:flex;align-items:center;justify-content:center"><div style="width:44px;height:44px;border:2px solid #111;border-radius:50%;position:relative;animation:spin 3s cubic-bezier(.7,0,.3,1) infinite"><div class="a" style="left:20px;top:-6px;width:2px;height:20px;background:#e63946"></div></div></div><div class="n">미니멀 기하<small>원·선만으로 정갈</small></div></button>
<button class="c" data-id="swiss-grid" data-e="Swiss grid" data-ed="Big type on a grid" data-kd="격자 위 큰 활자" data-k="스위스 그리드"><div class="p" style="background:#fff"><div class="a" style="left:0;top:0;width:50%;height:100%;background:#e30613;animation:sx 1.6s steps(2) infinite"></div><div class="a" style="right:12px;bottom:8px;font-size:26px;font-weight:500;color:#111">Grid</div></div><div class="n">스위스 그리드<small>격자 위 큰 활자</small></div></button>
<button class="c" data-id="duotone-pop" data-e="Duotone pop" data-ed="Two bold colours flash" data-kd="두 강한 색이 번쩍" data-k="듀오톤 팝"><div class="p" style="animation:flash 1s infinite;display:flex;align-items:center;justify-content:center"><div style="width:44px;height:44px;border-radius:50%;background:#ffe600;animation:pop .5s infinite"></div></div><div class="n">듀오톤 팝<small>두 강한 색이 번쩍</small></div></button>
<button class="c" data-id="watercolor" data-e="Watercolor" data-ed="Paint bleeds in" data-kd="물감이 번지며 등장" data-k="수채화"><div class="p" style="background:#fbf8f1"><div class="a" style="left:40px;top:12px;width:50px;height:50px;border-radius:50%;background:#90caf9;animation:bleed 3s infinite"></div><div class="a" style="left:75px;top:24px;width:46px;height:46px;border-radius:50%;background:#f8bbd0;animation:bleed 3s 1s infinite"></div></div><div class="n">수채화<small>물감이 번지며 등장</small></div></button>
<button class="c" data-id="risograph-grain" data-e="Risograph" data-ed="Misregistered print layers" data-kd="어긋난 인쇄 색판" data-k="리소그래프"><div class="p" style="background:#f4efe6"><div class="a" style="left:52px;top:18px;width:46px;height:46px;border-radius:50%;background:#ff48b0;opacity:.85"></div><div class="a" style="left:62px;top:24px;width:46px;height:46px;border-radius:50%;background:#0078bf;opacity:.7;animation:mis 1s steps(2) infinite"></div></div><div class="n">리소그래프<small>어긋난 인쇄 색판</small></div></button>
<button class="c" data-id="ui-motion" data-e="UI motion" data-ed="Smooth app screens" data-kd="앱 화면 매끄럽게" data-k="UI 모션"><div class="p" style="background:#eef0f4;display:flex;justify-content:center;padding-top:6px;box-sizing:border-box"><div style="width:52px;height:100px;border-radius:10px;background:#fff;border:1px solid #c9ced8;padding:6px;box-sizing:border-box;display:flex;flex-direction:column;gap:4px"><div style="height:12px;border-radius:3px;background:#378add;animation:card 2.4s infinite"></div><div style="height:12px;border-radius:3px;background:#b5d4f4;animation:card 2.4s .2s infinite"></div><div style="height:12px;border-radius:3px;background:#b5d4f4;animation:card 2.4s .4s infinite"></div></div></div><div class="n">UI 모션<small>앱 화면 매끄럽게</small></div></button>
<button class="c" data-id="parallax-2-5d" data-e="2.5D parallax" data-ed="Layers with depth" data-kd="레이어가 깊이감 있게" data-k="2.5D 패럴랙스"><div class="p" style="background:#ffd6a5"><div class="a" style="left:0;bottom:22px;width:200%;height:30px;background:repeating-linear-gradient(90deg,#e9a178 0 40px,transparent 40px 80px);animation:px1 8s linear infinite"></div><div class="a" style="left:0;bottom:0;width:200%;height:26px;background:repeating-linear-gradient(90deg,#6d597a 0 30px,#b56576 30px 60px);animation:px1 3s linear infinite"></div></div><div class="n">2.5D 패럴랙스<small>레이어가 깊이감 있게</small></div></button>
<button class="c" data-id="isometric" data-e="Isometric" data-ed="45° blocks assemble" data-kd="45° 블록이 조립됨" data-k="아이소메트릭"><div class="p" style="background:#e8f4f0;perspective:400px"><div class="a" style="left:50%;top:50%;width:0;height:0;transform-style:preserve-3d;transform:rotateX(-30deg) rotateY(45deg)"><div class="cu" style="left:-34px;--t:-4px;animation:rt 1.6s infinite"><i style="background:#9fe1cb;transform:rotateX(90deg) translateZ(11px)"></i><i style="background:#5dcaa5;transform:translateZ(11px)"></i><i style="background:#1d9e75;transform:rotateY(90deg) translateZ(11px)"></i></div><div class="cu" style="left:-11px;--t:-4px;animation:rt 1.6s .3s infinite"><i style="background:#f5c4b3;transform:rotateX(90deg) translateZ(11px)"></i><i style="background:#f0997b;transform:translateZ(11px)"></i><i style="background:#d85a30;transform:rotateY(90deg) translateZ(11px)"></i></div><div class="cu" style="left:12px;--t:-4px;animation:rt 1.6s .6s infinite"><i style="background:#cecbf6;transform:rotateX(90deg) translateZ(11px)"></i><i style="background:#7f77dd;transform:translateZ(11px)"></i><i style="background:#534ab7;transform:rotateY(90deg) translateZ(11px)"></i></div></div></div><div class="n">아이소메트릭<small>45° 블록이 조립됨</small></div></button>
<button class="c" data-id="3d-clay" data-e="3D clay" data-ed="Squishy clay squash and bounce" data-kd="말랑한 점토가 꾹 눌렸다 튐" data-k="3D 클레이"><div class="p" style="background:#f6e6d8;display:flex;align-items:flex-end;justify-content:center"><div class="a" style="bottom:9px;left:50%;width:50px;height:9px;margin-left:-25px;border-radius:50%;background:rgba(110,50,30,.28);animation:shd 1.1s infinite ease-in-out"></div><div style="position:relative;width:50px;height:44px;margin-bottom:12px;border-radius:52% 48% 44% 46%/60% 58% 42% 40%;background:radial-gradient(circle at 34% 28%,#ffd3dd 0,#ff9ab3 35%,#ec6f8f 70%,#c24c6c 100%);box-shadow:inset -5px -7px 9px rgba(120,20,50,.35),inset 4px 5px 7px rgba(255,255,255,.45);transform-origin:50% 100%;animation:sq2 1.1s infinite ease-in-out"><div class="a" style="inset:0;border-radius:inherit;background:repeating-radial-gradient(circle at 70% 65%,rgba(255,255,255,.06) 0 1.5px,transparent 1.5px 5px)"></div><div class="a" style="left:13px;top:15px;width:7px;height:9px;border-radius:50%;background:#3b1a24;box-shadow:inset 1px 1px 0 rgba(255,255,255,.6)"></div><div class="a" style="left:29px;top:15px;width:7px;height:9px;border-radius:50%;background:#3b1a24;box-shadow:inset 1px 1px 0 rgba(255,255,255,.6)"></div><div class="a" style="left:19px;top:28px;width:12px;height:5px;border-radius:0 0 8px 8px;background:#9c2f4c"></div></div></div><div class="n">3D 클레이<small>말랑한 점토가 꾹 눌렸다 튐</small></div></button>
<button class="c" data-id="clay-stopmotion" data-e="Claymation" data-ed="Clay puppet, frame by frame" data-kd="점토 인형이 덜컥덜컥" data-k="스톱모션 클레이"><div class="p" style="background:#e9dcc8;display:flex;align-items:flex-end;justify-content:center"><div class="a" style="left:0;right:0;bottom:0;height:14px;background:#b9a27f"></div><div style="position:relative;width:36px;height:46px;margin-bottom:12px;background:radial-gradient(circle at 35% 25%,#ffc98a 0,#f59a3c 45%,#c96a1c 100%);box-shadow:inset -4px -5px 7px rgba(110,50,0,.35),inset 3px 3px 5px rgba(255,255,255,.4);animation:boil 1.6s steps(1,end) infinite"><div class="a" style="inset:0;border-radius:inherit;background:repeating-radial-gradient(circle at 30% 70%,rgba(80,30,0,.10) 0 1px,transparent 1px 4px)"></div><div class="a" style="left:8px;top:12px;width:6px;height:6px;border-radius:50%;background:#2b1500"></div><div class="a" style="left:21px;top:12px;width:6px;height:6px;border-radius:50%;background:#2b1500"></div></div></div><div class="n">스톱모션 클레이<small>점토 인형이 덜컥덜컥</small></div></button>
<button class="c" data-id="glass-3d" data-e="Glass 3D" data-ed="Glass cube catching light" data-kd="유리 큐브가 빛을 받으며 회전" data-k="글래스 3D"><div class="p" style="background:#0f1c2e;perspective:300px;display:flex;align-items:center;justify-content:center"><div class="a" style="left:34px;top:12px;width:40px;height:40px;border-radius:50%;background:radial-gradient(circle at 35% 30%,#ffb199,#ff7a59 50%,#c4431f)"></div><div class="a" style="right:30px;bottom:8px;width:32px;height:32px;border-radius:50%;background:radial-gradient(circle at 35% 30%,#b8ecff,#4cc9f0 50%,#1f7fa8)"></div><div style="position:relative;width:40px;height:40px;transform-style:preserve-3d;animation:cube 7s linear infinite"><i class="f" style="transform:translateZ(20px)"></i><i class="f" style="transform:rotateY(90deg) translateZ(20px)"></i><i class="f" style="transform:rotateY(180deg) translateZ(20px)"></i><i class="f" style="transform:rotateY(-90deg) translateZ(20px)"></i><i class="f" style="transform:rotateX(90deg) translateZ(20px)"></i><i class="f" style="transform:rotateX(-90deg) translateZ(20px)"></i></div></div><div class="n">글래스 3D<small>유리 큐브가 빛을 받으며 회전</small></div></button>
<button class="c" data-id="chrome-metal" data-e="Chrome / metal" data-ed="Shiny metal object" data-kd="반짝이는 금속 오브젝트" data-k="크롬·메탈"><div class="p" style="background:radial-gradient(circle at 50% 120%,#3a3a44,#121216 70%);display:flex;align-items:center;justify-content:center"><div style="position:relative;width:52px;height:52px;border-radius:50%;overflow:hidden;background:radial-gradient(circle at 36% 28%,#fff 0,#f0f0f0 10%,#9a9aa2 30%,#2a2a30 52%,#8c8c94 66%,#e8e8ee 78%,#55555c 100%);box-shadow:0 6px 10px rgba(0,0,0,.5)"><div class="a" style="inset:0;background:linear-gradient(110deg,transparent 35%,rgba(255,255,255,.75) 48%,transparent 60%);background-size:250% 100%;animation:sheen 2.2s infinite"></div></div></div><div class="n">크롬·메탈<small>반짝이는 금속 오브젝트</small></div></button>
<button class="c" data-id="3d-type" data-e="3D typography" data-ed="Extruded letters rotate" data-kd="두께 있는 글자가 회전" data-k="3D 타이포"><div class="p" style="background:#fff4e6;perspective:220px;display:flex;align-items:center;justify-content:center"><span style="display:inline-block;font-size:36px;font-weight:500;letter-spacing:1px;color:#ff6b6b;text-shadow:1px 1px 0 #e05555,2px 2px 0 #d24c4c,3px 3px 0 #c44343,4px 4px 0 #b63a3a,5px 5px 0 #a83232,6px 6px 0 #9a2a2a,8px 10px 8px rgba(0,0,0,.25);animation:tilt 2.4s infinite ease-in-out">3D</span></div><div class="n">3D 타이포<small>두께 있는 글자가 회전</small></div></button>
<button class="c" data-id="low-poly" data-e="Low-poly" data-ed="Faceted shape spins" data-kd="각진 다면체가 회전" data-k="로우폴리"><div class="p" style="background:#eaf3de;perspective:300px;display:flex;align-items:center;justify-content:center"><svg viewBox="0 0 60 60" width="56" height="56" style="animation:spinY 4s linear infinite"><polygon points="30,4 12,22 30,26" fill="#c0dd97"/><polygon points="30,4 48,22 30,26" fill="#97c459"/><polygon points="12,22 30,26 30,56" fill="#639922"/><polygon points="48,22 30,26 30,56" fill="#3b6d11"/><polygon points="12,22 4,34 30,56" fill="#27500a"/><polygon points="48,22 56,34 30,56" fill="#173404"/></svg></div><div class="n">로우폴리<small>각진 다면체가 회전</small></div></button>
<button class="c" data-id="inflatable" data-e="Inflatable" data-ed="Puffs up like a balloon" data-kd="풍선처럼 부풀었다 꺼짐" data-k="인플레이터블"><div class="p" style="background:#e6f1fb;display:flex;align-items:center;justify-content:center"><div style="position:relative;width:70px;height:40px;border-radius:22px;background:radial-gradient(ellipse at 35% 25%,#d9f3ff 0,#7cc8f5 35%,#2f8fd1 75%,#1d6aa3 100%);box-shadow:inset -4px -6px 10px rgba(10,50,100,.35),0 8px 8px -4px rgba(10,50,100,.3);animation:inflate 1.8s infinite ease-in-out"><div class="a" style="left:12px;top:7px;width:22px;height:8px;border-radius:50%;background:rgba(255,255,255,.75)"></div><div class="a" style="left:34px;top:4px;bottom:4px;width:1px;background:rgba(10,50,100,.25)"></div></div></div><div class="n">인플레이터블<small>풍선처럼 부풀었다 꺼짐</small></div></button>
<button class="c" data-id="jelly-softbody" data-e="Jelly / soft-body" data-ed="Wobbly and jiggly" data-kd="탱글탱글 출렁임" data-k="젤리·소프트바디"><div class="p" style="background:#fbeaf0;display:flex;align-items:flex-end;justify-content:center"><div class="a" style="bottom:9px;left:50%;width:54px;height:8px;margin-left:-27px;border-radius:50%;background:rgba(60,120,40,.22)"></div><div style="position:relative;width:46px;height:42px;margin-bottom:12px;border-radius:12px;background:linear-gradient(160deg,rgba(190,240,150,.95),rgba(99,153,34,.85));box-shadow:inset 4px 4px 8px rgba(255,255,255,.6),inset -5px -6px 10px rgba(39,80,10,.45);transform-origin:50% 100%;animation:jelly 1.4s infinite"><div class="a" style="left:7px;top:6px;width:14px;height:6px;border-radius:50%;background:rgba(255,255,255,.8)"></div></div></div><div class="n">젤리·소프트바디<small>탱글탱글 출렁임</small></div></button>
</div>
<div style="display:flex;align-items:center;gap:12px;margin-top:14px;flex-wrap:wrap">
<span id="st" style="font-size:13px;color:var(--text-secondary)">첫 번째 클릭은 메인 스타일(실선), 두 번째 클릭은 보조 스타일(점선)이에요.</span>
<button id="go" style="margin-left:auto">이 스타일로 진행 ↗</button>
</div>
<script>
const T={ko:{h:'첫 번째 클릭은 메인 스타일(실선), 두 번째 클릭은 보조 스타일(점선)이에요.',m:'메인: ',s:' · 보조: ',o:' · 보조는 선택 사항이에요',e:'메인 스타일을 먼저 하나 골라 주세요.',go:'이 스타일로 진행 ↗'},
en:{h:'First click = main style (solid), second click = accent style (dashed).',m:'Main: ',s:' · Accent: ',o:' · accent is optional',e:'Pick a main style first.',go:'Continue with this style ↗'}};
let L=(document.documentElement.lang||navigator.language||'ko').toLowerCase().startsWith('ko')?'ko':'en';
let m=null,s=null;const st=document.getElementById('st'),go=document.getElementById('go');
const nm=c=>L==='ko'?c.dataset.k:c.dataset.e;
function lang(l){L=l;document.querySelectorAll('.c').forEach(c=>{c.querySelector('.n').innerHTML=(L==='ko'?c.dataset.k+'<small>'+c.dataset.kd:c.dataset.e+'<small>'+c.dataset.ed)+'</small>'});go.textContent=T[L].go;document.getElementById('lk').style.fontWeight=L==='ko'?'500':'400';document.getElementById('le').style.fontWeight=L==='en'?'500':'400';paint()}
function paint(){document.querySelectorAll('.c').forEach(c=>{c.classList.toggle('m',c===m);c.classList.toggle('s',c===s)});st.textContent=m?(T[L].m+nm(m)+(s?T[L].s+nm(s):T[L].o)):T[L].h;st.style.color='var(--text-secondary)'}
document.getElementById('g').addEventListener('click',e=>{const c=e.target.closest('.c');if(!c)return;if(c===m){m=s;s=null}else if(c===s){s=null}else if(!m){m=c}else{s=c}paint()});
document.getElementById('lk').addEventListener('click',()=>lang('ko'));document.getElementById('le').addEventListener('click',()=>lang('en'));
go.addEventListener('click',()=>{if(!m){st.textContent=T[L].e;st.style.color='var(--text-danger)';return}sendPrompt(L==='ko'?('모션 스타일 선택 → 메인: '+m.dataset.id+' ('+m.dataset.k+')'+(s?', 보조: '+s.dataset.id+' ('+s.dataset.k+')':', 보조: 없음')):('Motion style picked → main: '+m.dataset.id+' ('+m.dataset.e+')'+(s?', accent: '+s.dataset.id+' ('+s.dataset.e+')':', accent: none')))});
lang(L);
</script>
```
