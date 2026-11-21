---
name: motion-style-picker
description: "Motion graphics style picker for when you don't know the style name. 모션그래픽 스타일 이름을 모르겠어? 모션그래픽 스타일이름 모를 때, 모션 그래픽 스타일 추천. I don't know the name of the motion graphics style / animation style. Animated, grouped preview gallery of 90 options in English or Korean: 69 styles (kinetic type, 3D clay, glass, ukiyo-e, stained glass, ink wash, blueprint, synthwave, terminal, isometric, glitch...), 9 short-form formats (quiz, tier list, chat story), 7 caption overlays and 5 motion feels (on twos, stroke by stroke). Then a scene breakdown and an English motion prompt. 그룹별 움직이는 미리보기 90종(스타일·숏폼 포맷·자막 오버레이·움직임 느낌)을 보고 고르면 장면 구성과 영어 프롬프트를 만들어 줍니다. Use when: 모션그래픽 스타일 이름 모름, 애니메이션 스타일 고르기, 3D 클레이, 영상 멋지게, 로고 인트로, 설명 영상, 숏폼 광고, motion design style, animation style picker."
---

# Motion Style Picker

사람들은 모션그래픽 스타일 이름(키네틱 타이포, 아이소메트릭, 러버호스…)을 몰라서 "영상 멋지게", "움직이게"라고만 말합니다. 이 스킬은 객관식으로 용도를 묻고, **사용자의 글자로 실제로 움직이는 미리보기 갤러리**로 스타일을 고르게 하고, 다시 객관식으로 움직임과 세부 사항을 정한 뒤, 그대로 재현할 수 있는 프롬프트를 만듭니다.

People rarely know motion-style names. This skill asks a few multiple-choice questions, shows an animated gallery so the user picks by sight, then produces a scene breakdown and a ready-to-paste English motion prompt. Reply in the user's language.

## 파일 구성 / Files

- `SKILL.md` : 진행 순서와 스타일·유형 데이터 (갤러리는 링크로 열므로 이 파일만 있어도 동작)
- `assets/gallery.html` : 브라우저에서 바로 열 수 있는 독립 실행판 갤러리 (GitHub Pages로도 공개)
- `assets/gallery-widget.html` : 채팅 안 인라인 위젯용 조각

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

When the gallery button is pressed in English, the message looks like `Motion style picked → main: 3d-clay (3D clay), accent: none · format: none · overlays: none · feel: feel-twos (On twos (12 fps)) · text: "Morning Coffee"`. Use that text in the scenes and prompt. Treat it the same as the Korean message. Write the summary and scene breakdown in English for English users.

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

**A. 기본: 미리 만든 갤러리 링크 (가장 빠름, 모든 환경)**
갤러리 코드를 매번 새로 쓰지 않습니다. 아래 링크를 주고 바로 기다립니다.
1. 1라운드 답을 어떻게 이해했는지 한 줄로 쓰고 이렇게 안내합니다. "아래 링크에서 스타일마다 실제로 움직이는 미리보기 90종을 볼 수 있어요. 위 칸에 영상 글자를 넣고, 카드를 골라 버튼을 누르면 선택 문장이 복사돼요. 여기에 붙여 넣어 주세요."
   - 링크: https://eminoart.github.io/motion-style-picker/
   - 안 열리면: https://raw.githack.com/eminoart/motion-style-picker/main/skills/motion-style-picker/assets/gallery.html
   - 사용자가 대화에서 이미 글자(브랜드명·카피)를 말했다면 "위 칸에 ○○을 넣어 보세요"라고 덧붙입니다.
2. 링크와 함께 **바로 고를 수 있는 단축 선택지**도 줍니다. `AskUserQuestion`으로 용도에 맞는 후보 4개를 후보표에서 골라 묻습니다(header: 스타일, 선택지 설명은 스타일표의 한 줄 설명). 사용자는 링크를 보지 않고 바로 골라도 됩니다.
3. 붙여 넣은 문장은 `모션 스타일 선택 → 메인: kinetic-type (키네틱 타이포), 보조: 없음 · 포맷: chat-story (채팅 스토리) · 오버레이: punch-captions (펀치 자막) · 움직임: feel-twos (투스 (12fps)) · 글자: "오늘의 커피"` 형식입니다(영어 화면이면 `Motion style picked → main: … · format: … · overlays: … · feel: … · text: "…"`). 예전 형식(메인·보조·글자만)도 똑같이 받습니다. 이 문장이나 단축 선택지 답이 오면 바로 2라운드로 넘어가고, `글자`는 장면 구성과 프롬프트에 그대로 씁니다. 포맷·오버레이·움직임이 `없음`/`기본`이면 스타일에 맞게 정합니다.

**A-2. 인라인 위젯 (사용자가 "여기서 보여줘", "채팅 안에서 볼래"라고 할 때만)**
Visualizer `show_widget`이 있으면 `assets/gallery-widget.html`을 읽어 한 글자도 바꾸지 않고 `widget_code`로 넘깁니다(title `motion_style_gallery`, 처음이면 `read_me` modules: interactive를 먼저 조용히 호출). 코드가 커서 뜨는 데 시간이 걸린다고 한 줄 알려 줍니다. 위젯 버튼은 선택 문장을 채팅으로 바로 보냅니다.

**B. 셸이 있는 코딩 도구 (Claude Code, Codex, Cursor, Gemini CLI 등)**
1. 이 스킬 폴더의 `assets/gallery.html`을 OS 임시 폴더에 복사해 브라우저로 엽니다(macOS `open`, Linux `xdg-open`, Windows `start`). 파일이 없으면 A의 링크를 주거나, `assets/gallery-widget.html` 앞에 `<!doctype html><meta charset="utf-8"><style>:root{--border:#ddd;--border-accent:#378add;--surface-2:#fff;--text-secondary:#666;--text-danger:#c00;--text-accent:#185fa5;--bg-neutral:#f3f4f6}body{font-family:sans-serif;padding:16px}.sr-only{position:absolute;left:-9999px}</style><script>function sendPrompt(t){navigator.clipboard.writeText(t).then(()=>alert('복사됨 / Copied: '+t))}</script>`를 붙여 파일로 만듭니다.
2. "카드를 고르고 버튼을 누르면 문장이 복사돼요. 여기에 붙여 넣어 주세요"라고 안내합니다. 브라우저를 열 수 없으면 파일 경로를 알려 주고 C 방식도 함께 보여 줍니다.

**C. 둘 다 안 될 때 (ChatGPT 등 위젯·셸 없음)**
- 아래 **그룹표** 순서대로 스타일표를 묶어 "한글 이름: 한 줄 설명" 목록으로 보여 주고, 이름이나 번호로 고르게 합니다. 목록이 길면 먼저 그룹을 고르게 한 뒤(또는 후보표의 느낌으로 좁힌 뒤) 그 그룹만 보여 줍니다. 포맷·오버레이·움직임 느낌은 스타일을 고른 뒤 "원하면 고르세요"로 한 번에 보여 줍니다.

## 2라운드: 움직임 (2문항)

1. **애니메이션 유형** (header: 움직임, multiSelect: true) — 용도에 맞는 4개를 **유형표**에서 고름
   - 로고 인트로 → 라인 드로잉, 마스크 리빌, 모프, 파티클
   - 설명 영상 → 순차 등장, 라인 드로잉, 카운트업·차트, 카메라 줌
   - SNS 숏폼 → 키네틱 텍스트, 팝·바운스, 와이프 전환, 비트 싱크 컷
   - UI 모션 → 페이드·슬라이드, 스케일 팝, 공유 요소 전환, 마이크로 인터랙션
   - 용도를 여러 개 골랐다면 각 용도에서 하나씩 섞어 4개를 만들고, 고른 스타일과 잘 맞는 것을 먼저 놓습니다.
2. **속도·리듬** (header: 템포)
   - 갤러리에서 움직임 느낌(feel-*)을 골랐어도 템포는 묻습니다. 느낌은 프레임 수(끊김 정도), 템포는 이징과 빠르기입니다.
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
| 깔끔·신뢰감 | flat-2d, swiss-grid, infographic, geometric-minimal, blueprint, glass-icons |
| 귀엽고 친근 | rubber-hose, 3d-clay, inflatable, jelly-softbody, clay-stopmotion, clay-diorama, storybook, paper-craft, physics-toybox |
| 힙하고 강렬 | kinetic-type, glitch, paper-collage, duotone-pop, zine-collage, comic-panels, pop-info |
| 고급·감성 | liquid-morph, glass-3d, chrome-metal, watercolor, line-art, ink-wash, calligraphy-draw, quote-cinema, product-turntable |
| 미래적 | neon-cyber, particle-abstract, isometric, parallax-2-5d, deep-layers, bio-glow, globe-arcs, terminal |
| 레트로 | retro-vhs, pixel-8bit, risograph-grain, synth-grid, retro-scrapbook, doc-cinema |
| 동양·전통·역사 | ink-wash, ukiyo-e, calligraphy-draw, stained-glass, mosaic, parchment-map, shadow-puppets |
| 이야기·미스터리 | storybook, visual-novel, evidence-board, shadow-puppets, doc-cinema, parchment-map |
| 3D·입체감 | 3d-clay, glass-3d, 3d-type, inflatable, chrome-metal, low-poly, jelly-softbody, clay-stopmotion, isometric, clay-diorama, iso-cutaway, exploded-view, product-turntable, data-city, synth-grid |
| 정보 전달 | infographic, isometric, whiteboard-doodle, ui-motion, blueprint, isotype, timeline-rail, math-canvas, tactics-board, market-tape, size-lineup, cosmic-scale, nature-notebook |

## 그룹표 (갤러리 탭 순서)

| 그룹 | 종류 | id |
|---|---|---|
| 2D 기본 | 스타일 | kinetic-type, flat-2d, line-art, liquid-morph, rubber-hose, frame-by-frame, particle-abstract, geometric-minimal, swiss-grid, duotone-pop, ui-motion, parallax-2-5d |
| 일러스트·손그림 | 스타일 | whiteboard-doodle, paper-collage, watercolor, ink-wash, ukiyo-e, stained-glass, mosaic, storybook, nature-notebook, calligraphy-draw, paper-craft, zine-collage, retro-scrapbook, comic-panels, parchment-map, evidence-board, pop-info, shadow-puppets, visual-novel |
| 3D | 스타일 | 3d-clay, clay-stopmotion, clay-diorama, glass-3d, glass-icons, chrome-metal, 3d-type, low-poly, low-poly-atlas, inflatable, jelly-softbody, isometric, iso-cutaway, exploded-view, product-turntable, data-city, size-lineup, cosmic-scale, globe-arcs, physics-toybox, deep-layers, bio-glow, synth-grid |
| 레트로·텍스처 | 스타일 | glitch, retro-vhs, pixel-8bit, neon-cyber, risograph-grain, terminal, doc-cinema, quote-cinema |
| 그래픽·설명형 | 스타일 | infographic, blueprint, isotype, timeline-rail, math-canvas, tactics-board, market-tape |
| 숏폼 포맷 | 포맷 (0~1개) | 포맷표 참고 |
| 편집 오버레이 | 오버레이 (0개 이상) | 오버레이표 참고 |
| 움직임 느낌 | 느낌 (0~1개) | 움직임 느낌표 참고 |

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
| ink-wash | 수묵화 | 먹이 번지며 여백 속에 글자가 떠오름 | sumi-e ink wash, ink bleeding on rice paper, generous negative space, red seal stamp |
| ukiyo-e | 우키요에 목판화 | 목판화 파도·해가 3프레임씩 끊겨 움직임 | ukiyo-e woodblock print, flat Prussian blue waves, paper grain, animated on threes at 10fps |
| stained-glass | 스테인드글라스 | 납선 사이 색유리가 빛을 받아 반짝 | stained glass panels, dark lead lines, jewel tones, light glow, on twos at 15fps |
| mosaic | 모자이크 타일 | 작은 타일이 하나씩 놓이며 그림 완성 | ancient mosaic tesserae, tiles placed one by one, grout lines, earthy palette |
| storybook | 동화책 | 그림책 한 장면처럼 따뜻하게 | children's storybook illustration, gouache texture, gentle page-turn reveals |
| nature-notebook | 자연 관찰 노트 | 모눈 노트에 식물 스케치가 그려짐 | naturalist field notebook, ink sketch draw-on, handwritten labels, grid paper |
| calligraphy-draw | 붓글씨 드로잉 | 붓 획이 써지며 글자가 완성 | brush calligraphy write-on, stroke order, wet ink, red seal |
| paper-craft | 페이퍼 크래프트 | 종이를 겹겹이 오려 붙인 입체 장면 | layered paper-cut diorama, drop shadows between layers, gentle parallax |
| zine-collage | 진 콜라주 | 복사기 질감, 오려 붙인 협박편지 글자 | photocopy zine collage, ransom-note letters, halftone, stop-motion jitter |
| retro-scrapbook | 레트로 스크랩북 | 폴라로이드·테이프·스티커가 붙음 | retro scrapbook, polaroids, washi tape, stickers, kraft paper |
| comic-panels | 만화 컷 | 망점 컷과 말풍선, POW! | comic book panels, halftone dots, speech bubbles, onomatopoeia pops |
| parchment-map | 양피지 지도 | 점선 경로가 그려지며 목적지 X | parchment treasure map, dotted route draw-on, compass, sepia ink |
| evidence-board | 수사 보드 | 코르크판 사진을 빨간 실이 연결 | detective evidence board, cork, pinned photos, red string connecting |
| pop-info | 팝 인포 | 큰 숫자 배지와 굵은 글씨로 꿀팁 | pop infographic listicle, big number badges, bold type, hard shadows |
| shadow-puppets | 그림자극 | 노을빛 막 뒤 실루엣이 움직임 | shadow puppet theatre, black silhouettes, warm backlit screen |
| visual-novel | 비주얼 노벨 | 대화창에 글자가 타이핑됨 | visual novel UI, dialogue box typewriter text, character sprite, name tag |
| clay-diorama | 클레이 디오라마 | 점토로 만든 작은 미니어처 세트 | clay miniature diorama, tilt-shift, soft studio light, handmade props |
| iso-cutaway | 아이소 단면도 | 건물 벽이 열리며 내부가 보임 | isometric cutaway, walls slide away to reveal interior rooms |
| exploded-view | 분해도 | 부품 층이 위로 떠오르며 분해 | exploded view, layers separate vertically, callout labels |
| product-turntable | 제품 턴테이블 | 제품이 받침대 위에서 360° 회전 | product turntable 360 spin, studio backdrop, soft reflections |
| glass-icons | 글래스 아이콘 | 반투명 유리 아이콘이 둥둥 | glassmorphism 3D icons, frosted blur, colourful blobs behind |
| data-city | 데이터 시티 | 막대 그래프가 빌딩처럼 솟음 | isometric data city, bars rise like buildings, clean pastel |
| size-lineup | 크기 비교 라인업 | 작은 것부터 큰 것까지 옆으로 이동 | size comparison lineup, objects scale up left to right, camera pan |
| cosmic-scale | 우주 스케일 줌 | 원이 겹겹이 줌아웃되며 규모 비교 | powers-of-ten zoom-out, nested orbits, starfield |
| globe-arcs | 지구본 경로 | 회전하는 지구 위로 곡선 경로 | rotating globe, glowing flight arcs, dark space |
| physics-toybox | 물리 장난감 | 글자가 떨어져 통통 튐 | rigid-body physics, letters drop and bounce, squash on impact |
| deep-layers | 깊이 레이어 | 화면 속으로 빨려 들어가는 터널 | z-depth tunnel, layers fly toward camera, neon outlines |
| bio-glow | 바이오 글로우 | 어둠 속 생물발광이 맥박처럼 | bioluminescent glow, deep-sea particles, cyan pulse |
| low-poly-atlas | 로우폴리 지도 | 각진 지형 위에 핀이 톡 | low-poly terrain map, faceted hills, bouncing location pin |
| synth-grid | 신스웨이브 그리드 | 80년대 석양과 달리는 네온 격자 | synthwave, striped sunset, perspective neon grid scrolling, chrome text |
| terminal | 터미널 | 검은 화면에 초록 글자가 타이핑 | terminal UI, monospace green text typing, blinking cursor |
| doc-cinema | 다큐 시네마 | 흑백 사진이 천천히 줌, 레터박스 자막 | documentary Ken Burns on archival photos, film grain, letterbox, serif captions |
| quote-cinema | 명언 시네마 | 검은 화면에 명언이 단어씩 떠오름 | cinematic quote card, word-by-word fade, serif italic, gold accents |
| blueprint | 블루프린트 | 파란 설계도 위에 선과 치수가 그려짐 | technical blueprint, white line draw-on, dimension lines, grid |
| isotype | 아이소타입 픽토그램 | 사람 아이콘이 줄지어 비율을 보여 줌 | ISOTYPE pictogram chart, icons appear one by one, two-colour |
| timeline-rail | 타임라인 레일 | 연도 점을 따라 카메라가 이동 | horizontal timeline rail, dots and years, camera tracks along |
| math-canvas | 수학 캔버스 | 어두운 캔버스에 그래프가 그려짐 | math explainer canvas, dark background, function plot draws, moving dot |
| tactics-board | 전술 보드 | X·O와 화살표로 작전 설명 | sports tactics board, chalk X and O, arrows drawing paths |
| market-tape | 마켓 테이프 | 캔들 차트와 흐르는 시세 띠 | stock market candlesticks, scrolling ticker tape, green/red |

## 포맷표 (숏폼 포맷, 영상의 틀)

| id | 한글 | 설명 | 영어 |
|---|---|---|---|
| quiz-countdown | 퀴즈 카운트다운 | 질문 + 보기 4개 + 원형 타이머, 정답 공개 | quiz format, 4 options, circular countdown timer, answer reveal |
| top5-countdown | TOP 5 카운트다운 | 5→1 순위 숫자가 넘어감 | top-5 countdown, big rank numbers flip |
| tier-list | 티어 리스트 | S·A·B 줄에 항목이 떨어져 들어감 | tier list board, items drop into S/A/B rows |
| chat-story | 채팅 스토리 | 메신저 말풍선이 차례로 뜸 | chat message story, bubbles pop in sequence |
| versus-split | VS 대결 | 두 쪽 화면이 밀려 들어오고 VS | versus split screen, diagonal halves slide in, VS badge |
| myth-or-fact | 진짜? 가짜? | MYTH 카드가 뒤집혀 FACT | myth vs fact card flip |
| recipe-steps | 레시피 스텝 | STEP 카드가 순서대로 | step-by-step recipe cards |
| breaking-desk | 속보 데스크 | BREAKING 띠와 흐르는 뉴스 티커 | breaking news lower bar, scrolling ticker, LIVE badge |
| podcast-clip | 팟캐스트 클립 | 프로필 + 파형 + 자막 | podcast audiogram, waveform bars, captions |

## 오버레이표 (편집 오버레이, 여러 개 가능)

| id | 한글 | 설명 | 영어 |
|---|---|---|---|
| punch-captions | 펀치 자막 | 말에 맞춰 단어가 툭툭, 핵심어는 노랑 | punchy word-by-word captions, bold outlined, keyword highlight |
| karaoke-subs | 노래방 자막 | 글자가 왼쪽부터 색이 채워짐 | karaoke subtitles, colour fill sweeps across words |
| callout-kit | 콜아웃 강조 | 동그라미·화살표·라벨이 그려짐 | hand-drawn circle and arrow callouts, label pop |
| lower-thirds | 로어서드 이름 자막 | 이름·직함 바가 옆에서 밀려 나옴 | lower-third name bar slides in |
| headline-backdrop | 박스 헤드라인 | 흰·노랑 박스 위 굵은 글씨 | boxed headline text, rounded highlight backgrounds |
| stack-split | 위아래 분할 | 위는 말하는 화면, 아래는 게임·리액션 | stacked split screen, top talking head, bottom gameplay |
| sticker-pop | 스티커 팝 | 흰 테두리 이모지 스티커가 톡톡 | emoji stickers with white outline pop in |

## 움직임 느낌표 (프레임 리듬)

| id | 한글 | 설명 | 영어 |
|---|---|---|---|
| feel-smooth | 부드럽게 (매 프레임) | 60fps로 매끈하게 | smooth on ones, 60fps, eased |
| feel-twos | 투스 (12fps) | 2프레임마다 한 장, 손그림 애니 느낌 | animated on twos, 12fps stepped |
| feel-threes | 쓰리스 (8fps) | 3프레임마다 한 장, 목판·종이 애니 | animated on threes, 8fps, deliberate choppiness |
| feel-stepped | 포즈 투 포즈 | 중간 없이 핵심 포즈만 딱딱 | pose-to-pose holds, stepped keys, no in-betweens |
| feel-stroke | 한 획씩 | 선이 한 획씩 그려짐 | stroke-by-stroke draw-on, sequential strokes |

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
- 포맷·오버레이·움직임 느낌: … (고르지 않았으면 이 줄은 스타일에 맞게 정한 것으로 씀)
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
- 포맷을 골랐으면 장면 구성을 그 포맷의 틀(예: tier-list면 줄마다 항목이 떨어짐)로 짜고, 오버레이는 프롬프트에 "captions/overlays:" 문장으로, 움직임 느낌은 fps와 "animated on twos" 같은 표현으로 넣습니다. 느낌을 안 골랐으면 스타일에 맞게 정합니다(ukiyo-e는 threes, stained-glass·pixel-8bit·clay-stopmotion은 twos 이하 등).
- 3D 계열 스타일(3d-clay, clay-stopmotion, clay-diorama, glass-3d, glass-icons, chrome-metal, 3d-type, low-poly, low-poly-atlas, inflatable, jelly-softbody, iso-cutaway, exploded-view, product-turntable, data-city, globe-arcs, physics-toybox, synth-grid)은 프롬프트에 재질, 조명(soft key light, HDRI 등), 카메라 움직임을 넣고, Blender·Cinema 4D·Spline 같은 3D 툴이나 AI 영상 생성기에서 쓰면 가장 잘 나온다고 한 줄 알려 줍니다.

## 결과물별 다음 단계

- **프롬프트만**: 위 결과로 끝. 프롬프트를 코드 블록에 넣어 복사하기 쉽게 합니다.
- **HTML 애니메이션**: CSS/SVG/JS 한 파일로 만듭니다(3D는 three.js). 아티팩트·캔버스 기능이 있으면 거기에 게시하고, 없으면 파일로 줍니다. 라인아트 전용 스킬이 있으면 그것을 씁니다.
- **MP4 영상**: 영상 제작 스킬이나 도구(예: `video-making`, `line-art-animation`, Remotion, ffmpeg)가 있으면 위 장면 구성대로 만듭니다. 없으면 HTML 애니메이션을 만들고 화면 녹화 방법을 안내합니다.
- **AE·작업 지시서**: 장면별 레이어, 키프레임 시간, 이징 값(예: cubic-bezier(0.34,1.56,0.64,1)), 필요한 소스 목록을 표로 정리합니다.

## 해석 규칙

- "기타"에 비슷한 말("애플 광고 같은 거", "유리 느낌")이 오면 가장 가까운 스타일 id로 맞추고 어떤 스타일로 읽었는지 한 줄로 알려 줍니다. 특정 브랜드·작품을 그대로 베끼지 않고 그 분위기의 일반 스타일로 바꿉니다.
- 메인 1개는 필수, 보조는 0~1개. 포맷 0~1개, 오버레이 0개 이상, 움직임 느낌 0~1개. 서로 어울리지 않는 조합(예: pixel-8bit + glass-3d)은 한 줄로 이유를 말하고 대안을 제안합니다.
- 속도를 위해 2라운드(2문항)와 3라운드(최대 4문항)는 가능하면 `AskUserQuestion` 한 번에 묶어 최대 4문항으로 묻습니다(유형·템포·길이·색 우선, 나머지는 기본값).
- 질문은 1라운드, 갤러리, 2라운드, 3라운드까지만 합니다. 그 뒤에는 더 묻지 않고 만듭니다.

## 갤러리 파일

- `assets/gallery-widget.html` : `show_widget`에 그대로 넘기는 조각(약 78KB). 인라인 위젯을 원할 때만 읽습니다.
- `assets/gallery.html` : 브라우저에서 바로 여는 독립 실행판. 아래 주소로도 열립니다.
  - https://eminoart.github.io/motion-style-picker/ (GitHub Pages)
  - https://raw.githack.com/eminoart/motion-style-picker/main/skills/motion-style-picker/assets/gallery.html (Pages가 안 열릴 때)
