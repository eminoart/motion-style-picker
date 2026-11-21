---
name: motion-style-picker
description: "Motion graphics style picker for when you don't know the style name. 모션그래픽 스타일 이름을 모르겠어? 모션그래픽 스타일이름 모를 때, 모션 그래픽 스타일 추천. I don't know the name of the motion graphics style / animation style. Animated, grouped preview gallery of 90 options in English or Korean: 69 styles (kinetic type, 3D clay, glass, ukiyo-e, stained glass, ink wash, blueprint, synthwave, terminal, isometric, glitch...), 9 short-form formats (quiz, tier list, chat story), 7 caption overlays and 5 motion feels (on twos, stroke by stroke). Then a scene breakdown and an English motion prompt. 그룹별 움직이는 미리보기 90종(스타일·숏폼 포맷·자막 오버레이·움직임 느낌)을 보고 고르면 장면 구성과 영어 프롬프트를 만들어 줍니다. Use when: 모션그래픽 스타일 이름 모름, 애니메이션 스타일 고르기, 3D 클레이, 영상 멋지게, 로고 인트로, 설명 영상, 숏폼 광고, motion design style, animation style picker."
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

**A. 채팅 환경 (Visualizer `show_widget` 도구가 있을 때 — Claude.ai, Claude 데스크톱 등)**
1. 이 대화에서 처음 쓰는 거라면 Visualizer `read_me`(modules: interactive)를 먼저 조용히 호출합니다.
2. 이 파일 맨 아래 **갤러리 HTML**을 한 글자도 바꾸지 않고 `show_widget`의 `widget_code`로 넘깁니다. title은 `motion_style_gallery`입니다.
3. 위젯 앞에는 1라운드 답을 어떻게 이해했는지와 기본값으로 정한 것을 한두 문장으로 쓰고, "아래는 스타일마다 실제로 움직이는 미리보기 갤러리예요"로 끝냅니다.
4. 위젯 뒤에는 사용자 언어로 이렇게 안내합니다. "위 칸에 영상에 들어갈 글자를 쓰면 모든 미리보기가 그 글자로 바뀌어요. 위쪽 탭으로 그룹(2D 기본, 일러스트·손그림, 3D, 레트로·텍스처, 그래픽·설명형, 숏폼 포맷, 편집 오버레이, 움직임 느낌)만 골라 볼 수 있어요. 스타일 카드를 누르면 '메인 ✓', 하나 더 누르면 '보조 ✓'가 붙어요. 숏폼 포맷·편집 오버레이·움직임 느낌은 '선택 ✓'로 표시되고 고르지 않아도 돼요. 다 고른 뒤 아래 버튼을 눌러 주세요." 영어: "Type your words in the box and every preview uses them. Use the tabs to see one group. Click a style card for Main ✓, another for Accent ✓. Formats, overlays and motion feel show Picked ✓ and are optional. Then press Continue."
   - 사용자가 대화에서 이미 글자(브랜드명·카피)를 말했다면 위젯 앞 문장에서 "위 칸에 ○○을 넣어 보세요"라고 알려 줍니다. 위젯 코드는 바꾸지 않습니다.
5. 버튼을 누르면 `모션 스타일 선택 → 메인: kinetic-type (키네틱 타이포), 보조: 없음 · 포맷: chat-story (채팅 스토리) · 오버레이: punch-captions (펀치 자막) · 움직임: feel-twos (투스 (12fps)) · 글자: "오늘의 커피"` 같은 메시지가 들어옵니다(영어 화면이면 `Motion style picked → main: … · format: … · overlays: … · feel: … · text: "…"`). 예전 형식(메인·보조·글자만)도 똑같이 받습니다. 이 메시지가 오면 바로 2라운드로 넘어가고, `글자`는 장면 구성과 프롬프트에 그대로 씁니다(따로 다시 묻지 않음). 포맷·오버레이·움직임이 `없음`/`기본`이면 해당 항목은 스타일에 맞게 알아서 정합니다.

**B. 셸이 있는 코딩 도구 (Claude Code, Codex, Cursor, Gemini CLI 등)**
1. 이 스킬 폴더의 `assets/gallery.html`을 OS 임시 폴더에 복사해 브라우저로 엽니다(macOS `open`, Linux `xdg-open`, Windows `start`). 파일이 없으면 아래 갤러리 HTML 앞에 `<!doctype html><meta charset="utf-8"><style>:root{--border:#ddd;--border-accent:#378add;--surface-2:#fff;--text-secondary:#666;--text-danger:#c00;--text-accent:#185fa5;--bg-neutral:#f3f4f6}body{font-family:sans-serif;padding:16px}.sr-only{position:absolute;left:-9999px}</style><script>function sendPrompt(t){navigator.clipboard.writeText(t).then(()=>alert('복사됨 / Copied: '+t))}</script>`를 붙여 파일로 만듭니다.
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
.c{display:flex;flex-direction:column}.c>.stage,.c>.n{width:100%;box-sizing:border-box}
.tabs{display:flex;gap:6px;flex-wrap:wrap;margin:4px 0 10px}.tb{font-size:12px;padding:5px 11px;border-radius:999px}.tb.on{border-color:var(--border-accent);color:var(--text-accent);background:var(--surface-2)}
.gh{margin:16px 0 6px;font-size:15px;font-weight:500}.gh small{font-size:12px;font-weight:400;color:var(--text-secondary);margin-left:8px}
.bd.k{background:#0f6e56;color:#fff}.c.k{outline:3px solid #0f6e56;outline-offset:-1px}
@keyframes inkB{0%{transform:scale(.2);opacity:0}35%{opacity:.85}75%,100%{transform:scale(1.6);opacity:0}}
@keyframes wv{to{background-position:40px 0}}
@keyframes tileIn{0%{opacity:0;transform:scale(.2)}15%,70%{opacity:1;transform:scale(1)}85%,100%{opacity:0;transform:scale(.2)}}
@keyframes reveal{0%{stroke-dashoffset:0}60%,100%{stroke-dashoffset:-300}}
@keyframes grow{0%,10%{transform:scaleX(0)}40%,90%{transform:scaleX(1)}100%{transform:scaleX(0)}}
@keyframes tyS{0%{opacity:0}5%,80%{opacity:1}100%{opacity:0}}
@keyframes blink{50%{opacity:0}}
@keyframes cutA{0%,20%{transform:translate(0,0);opacity:1}45%,75%{transform:translate(0,40px);opacity:0}100%{transform:translate(0,0);opacity:1}}
@keyframes liftZ{0%,15%,100%{transform:translateZ(var(--z))}45%,70%{transform:translateZ(var(--z2))}}
@keyframes growY{0%{transform:scaleY(0)}35%,85%{transform:scaleY(1)}100%{transform:scaleY(0)}}
@keyframes pan{0%,12%{transform:translateX(0)}55%,78%{transform:translateX(-140px)}100%{transform:translateX(0)}}
@keyframes zo{0%{transform:scale(3);opacity:0}15%{opacity:1}100%{transform:scale(.4);opacity:1}}
@keyframes drop{0%{transform:translateY(-90px);opacity:0}5%{opacity:1}30%{transform:translateY(0) scale(1.2,.8)}42%{transform:translateY(-22px) scale(.95,1.05)}54%{transform:translateY(0) scale(1.08,.92)}62%,88%{transform:translateY(0) scale(1);opacity:1}100%{transform:translateY(0);opacity:0}}
@keyframes zoomIn{0%{transform:scale(.1);opacity:0}25%{opacity:1}100%{transform:scale(2.6);opacity:0}}
@keyframes pg{0%,100%{opacity:.5;transform:scale(.9)}50%{opacity:1;transform:scale(1.08)}}
@keyframes gridMv{to{background-position:0 12px}}
@keyframes kb{0%,100%{transform:scale(1) translate(0,0)}50%{transform:scale(1.18) translate(-6px,-3px)}}
@keyframes dashMv{to{stroke-dashoffset:-14}}
@keyframes ring{to{stroke-dashoffset:95}}
@keyframes ans{0%,75%{background:#fff;color:#333}80%,100%{background:#06d6a0;color:#fff}}
@keyframes cnt{to{transform:translateY(-320px)}}
@keyframes tierD{0%{transform:translateY(-60px);opacity:0}25%{transform:translateY(0);opacity:1}30%{transform:translateY(-3px)}35%,90%{transform:none;opacity:1}100%{opacity:0}}
@keyframes bub{0%{opacity:0;transform:translateY(8px) scale(.85)}8%,80%{opacity:1;transform:none}90%,100%{opacity:0}}
@keyframes vsL{0%{transform:translateX(-100%)}20%,90%{transform:none}100%{transform:translateX(-100%)}}
@keyframes vsR{0%{transform:translateX(100%)}20%,90%{transform:none}100%{transform:translateX(100%)}}
@keyframes flipC{0%,35%{transform:rotateY(0)}50%,85%{transform:rotateY(180deg)}100%{transform:rotateY(360deg)}}
@keyframes lt{0%,10%{transform:translateX(-105%)}25%,85%{transform:none}100%{transform:translateX(-105%)}}
@keyframes kf{0%,10%{background-size:0 100%,100% 100%}75%,100%{background-size:100% 100%,100% 100%}}
@keyframes mv{0%,100%{transform:translateX(-56px)}50%{transform:translateX(56px)}}
@keyframes stk{0%{stroke-dashoffset:400;opacity:1}15%,85%{stroke-dashoffset:0;opacity:1}100%{stroke-dashoffset:0;opacity:0}}
</style>
<h2 class="sr-only">내 글자로 보는 모션그래픽 스타일·포맷·오버레이·움직임 갤러리 (그룹별) / Grouped motion graphics gallery with your own text: styles, formats, overlays and motion feel.</h2>
<div style="display:flex;gap:10px;align-items:flex-end;flex-wrap:wrap;margin-bottom:6px">
  <div style="flex:1;min-width:220px"><label id="tl" for="txt" style="font-size:13px;color:var(--text-secondary)"></label><input id="txt" type="text" maxlength="20" style="width:100%;margin-top:4px"></div>
  <label style="display:flex;align-items:center;gap:6px;font-size:13px;color:var(--text-secondary);padding-bottom:8px"><input type="checkbox" id="hint" checked> <span id="hl"></span></label>
  <div style="display:flex;gap:6px;padding-bottom:4px"><button class="lg" id="lk">한국어</button><button class="lg" id="le">English</button></div>
</div>
<div id="e1" style="font-size:13px;color:var(--text-danger);min-height:16px;margin-bottom:4px"></div>
<div class="tabs" id="tabs"></div>
<div id="g"></div>
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
let G='ko';
const FE=(tf,lab,c)=>t=>S('#f8f9fa',`<div class="a" style="left:12px;top:10px;font-size:11px;font-family:var(--font-mono),monospace;color:#666">${lab}</div><div class="a" style="left:0;right:0;top:78px;height:1px;background:#ddd"></div><div style="position:relative;margin-top:14px;padding:4px 10px;border-radius:10px;background:${c};color:#fff;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px;white-space:nowrap;animation:mv 2.4s ${tf} infinite">${esc(t)}</div>`);
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
'jelly-softbody':t=>S('#fbeaf0',`<div class="a" style="bottom:20px;left:50%;width:60%;height:8px;margin-left:-30%;border-radius:50%;background:rgba(60,120,40,.2)"></div><div style="font-family:${RD};font-size:${fs(t)+4}px;font-weight:900;color:rgba(110,190,40,.9);text-shadow:0 3px 0 rgba(60,120,20,.7),0 0 16px rgba(190,240,150,.9);transform-origin:50% 100%;animation:jelly 1.5s infinite">${esc(t)}</div>`),
'ink-wash':t=>S('#f2ece0',`<div class="a" style="width:130px;height:84px;border-radius:50%;background:radial-gradient(#222 0,#2228 35%,transparent 70%);filter:blur(6px);animation:inkB 4s infinite"></div><div style="position:relative;font-family:'Songti SC','Noto Serif KR','Nanum Myeongjo',serif;font-size:${fs(t)}px;color:#111;animation:fadeT 4s infinite">${esc(t)}</div><div class="a" style="right:14px;bottom:12px;width:16px;height:16px;background:#c0392b;border-radius:2px;animation:fadeT 4s .3s infinite"></div>`),
'ukiyo-e':t=>S('#efe2c4',`<div class="a" style="right:18px;top:12px;width:34px;height:34px;border-radius:50%;background:#d9482b"></div><div class="a" style="left:0;right:0;bottom:0;height:44px;background:repeating-radial-gradient(circle at 0 100%,#1f3a5f 0 4px,#efe2c4 4px 7px,#4a6fa5 7px 10px,#efe2c4 10px 13px);background-size:40px 44px;animation:wv 1.2s steps(6) infinite"></div><div style="position:relative;margin-bottom:36px;font-family:serif;font-weight:700;font-size:${fs(t)}px;color:#1b1b1b;letter-spacing:.05em">${esc(t)}</div>`),
'stained-glass':t=>{const C=['#c0392b','#2e86de','#f1c40f','#27ae60','#8e44ad','#e67e22'];let p='';for(let i=0;i<24;i++)p+=`<div style="background:${C[(i*7)%6]};animation:facet 3s ${-(i%5)*.6}s infinite steps(3)"></div>`;return S('#111',`<div class="a" style="inset:6px 14px;display:grid;grid-template-columns:repeat(8,1fr);gap:3px;border-radius:50% 50% 6px 6px/45% 45% 6px 6px;overflow:hidden">${p}</div><div style="position:relative;font-family:serif;font-weight:700;font-size:${fs(t)}px;color:#fff8dc;-webkit-text-stroke:1.5px #111;paint-order:stroke;text-shadow:0 0 12px #fff8">${esc(t)}</div>`)},
'mosaic':t=>{const C=['#b5651d','#e3b778','#2c6e8f','#f5f0e1','#7a9e7e','#c94c4c'];let p='';for(let i=0;i<60;i++)p+=`<div style="background:${C[(i*13)%6]};border-radius:2px;animation:tileIn 4s ${((i*37)%60)/30}s infinite both"></div>`;return S('#efe6d6',`<div class="a" style="inset:0;display:grid;grid-template-columns:repeat(12,1fr);grid-template-rows:repeat(5,1fr);gap:2px;padding:2px">${p}</div><div style="position:relative;padding:4px 12px;background:#f5f0e1;border:3px solid #2c6e8f;font-weight:700;font-size:${fs(t)-4}px;color:#2c6e8f">${esc(t)}</div>`)},
'storybook':t=>S('radial-gradient(#fff7e6,#f3d9b1)',`<div class="a" style="left:22px;top:16px;font-size:18px;color:#e9a23b;animation:hop 1.8s infinite">★</div><div class="a" style="right:26px;top:24px;font-size:12px;color:#e9a23b;animation:hop 1.8s .5s infinite">★</div><div class="a" style="bottom:-34px;left:-10%;width:120%;height:60px;border-radius:50%;background:#a8c69f"></div><div style="position:relative;font-family:Georgia,'Nanum Myeongjo',serif;font-style:italic;font-size:${fs(t)}px;color:#6b3e26;animation:fadeT 4s infinite">${esc(t)}</div>`),
'nature-notebook':t=>S('#f7f4ea',`<svg class="a" style="left:10px;top:16px" width="64" height="92" viewBox="0 0 70 90"><path d="M35 85 C35 60 35 40 35 10 M35 30 C15 25 8 10 20 4 C30 8 35 20 35 30 M35 50 C55 45 62 30 52 22 C40 26 35 40 35 50" fill="none" stroke="#3d6b35" stroke-width="2" stroke-linecap="round" style="stroke-dasharray:400;animation:draw 3.5s infinite"/></svg><div style="position:relative;margin-left:64px;text-align:left"><div style="font-family:'Bradley Hand','Segoe Print',cursive;font-size:${Math.max(13,fs(t)-4)}px;color:#3d3326">${esc(t)}</div><div style="font-size:10px;color:#7a6f5a;font-style:italic;margin-top:3px">fig. 1 — 2026</div></div>`,'background-image:linear-gradient(#cfe0c4 1px,transparent 1px),linear-gradient(90deg,#cfe0c4 1px,transparent 1px);background-size:12px 12px'),
'calligraphy-draw':t=>S('#faf6ee',`<svg viewBox="0 0 220 124" width="100%" height="100%"><text x="110" y="74" text-anchor="middle" font-family="'Brush Script MT','Nanum Brush Script','Nanum Myeongjo',serif" font-size="${fs(t)+6}" stroke="#111" stroke-width="2.2" stroke-linejoin="round" style="stroke-dasharray:900;animation:drawT 3.6s infinite">${esc(t)}</text><rect x="178" y="88" width="16" height="16" rx="2" fill="#c0392b" style="animation:fadeT 3.6s infinite"/></svg>`),
'paper-craft':t=>S('#bfe3f0',`${[['#a7d7b5',74],['#6fb58a',54],['#3f8a5f',34]].map(([c,h],i)=>`<div class="a" style="left:-10%;width:120%;bottom:-6px;height:${h}px;background:${c};border-radius:50% 50% 0 0/100% 100% 0 0;box-shadow:0 -3px 6px #0003;animation:rise 3s ${-i*.5}s infinite ease-in-out"></div>`).join('')}<div class="a" style="right:24px;top:12px;width:26px;height:26px;border-radius:50%;background:#ffd166;box-shadow:2px 3px 4px #0003"></div><div style="position:relative;margin-bottom:40px;padding:4px 12px;background:#fff;box-shadow:3px 4px 0 #0002;font-weight:700;font-size:${fs(t)-4}px;color:#2f6e4a;animation:rise 3s infinite">${esc(t)}</div>`),
'zine-collage':t=>{const F=['Impact,sans-serif','Georgia,serif','Courier New,monospace','Arial Black,sans-serif'];return S('#e8e6e1',`<div style="font-size:${fs(t)}px">${L(t,i=>`font-family:${F[i%4]};background:${i%3==0?'#111':i%3==1?'#fff':'#ffe600'};color:${i%3==0?'#fff':'#111'};padding:0 2px;margin:0 1px;rotate:${(i*37%11)-5}deg;animation:jit .4s ${i*.05}s steps(2) infinite`)}</div>`,'background-image:radial-gradient(#0002 1px,transparent 1px);background-size:4px 4px')},
'retro-scrapbook':t=>S('#c9a77c',`<div style="position:relative;background:#fff;padding:8px 8px 18px;box-shadow:2px 3px 6px #0004;rotate:-4deg;animation:card 3.6s infinite both"><div style="min-width:110px;height:50px;padding:0 8px;background:linear-gradient(135deg,#f4a261,#e76f51);display:flex;align-items:center;justify-content:center;font-weight:700;color:#fff;white-space:nowrap;font-size:${Math.max(12,Math.min(20,fs(t)-6))}px">${esc(t)}</div><div class="a" style="top:-8px;left:40px;width:44px;height:14px;background:#fff8;border:1px solid #0001;rotate:6deg"></div></div><div class="a" style="right:14px;bottom:12px;padding:3px 8px;border-radius:999px;background:#ffd6e0;color:#c2185b;font-size:11px;font-weight:600;rotate:12deg;animation:popW 3.6s .6s infinite both">♥ 2026</div>`,'background-image:radial-gradient(#0001 1px,transparent 1px);background-size:5px 5px'),
'comic-panels':t=>S('#fff',`<div class="a" style="inset:6px;display:grid;grid-template-columns:1fr 1.4fr;gap:5px"><div style="border:2.5px solid #111;background:#ffd23f;background-image:radial-gradient(#e0a800 1.4px,transparent 1.6px);background-size:7px 7px"></div><div style="border:2.5px solid #111;background:#4cc9f0;background-image:radial-gradient(#2a9fd0 1.4px,transparent 1.6px);background-size:7px 7px"></div></div><div class="a" style="left:14px;top:40px;font-family:Impact,'Arial Black',sans-serif;font-size:20px;color:#e63946;-webkit-text-stroke:1px #111;animation:pop 2.4s infinite">POW!</div><div class="a" style="right:12px;top:30px;max-width:56%;background:#fff;border:2.5px solid #111;border-radius:50%;padding:10px 12px;font-family:'Comic Sans MS','Arial Black',sans-serif;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px;animation:popW 2.4s .4s infinite both">${esc(t)}</div>`),
'parchment-map':t=>S('radial-gradient(#f3e2b8,#d9bb82)',`<svg class="a" style="inset:0" width="100%" height="100%" viewBox="0 0 220 124"><path d="M20 104 C60 74 70 114 110 84 S160 44 190 40" fill="none" stroke="#8b2e16" stroke-width="2" stroke-dasharray="5 4"/><path d="M20 104 C60 74 70 114 110 84 S160 44 190 40" fill="none" stroke="#e6cd98" stroke-width="5" style="stroke-dasharray:300;animation:reveal 3.5s infinite"/><text x="190" y="46" text-anchor="middle" font-size="16" fill="#8b2e16" font-weight="700">✕</text></svg><div style="position:relative;margin-bottom:46px;font-family:Georgia,serif;font-variant:small-caps;font-size:${fs(t)-6}px;color:#4a2c12;letter-spacing:.06em">${esc(t)}</div>`),
'evidence-board':t=>S('#b8875a',`<div class="a" style="left:16px;top:14px;width:46px;height:38px;background:#eee;border:3px solid #fff;box-shadow:1px 2px 3px #0005;rotate:-6deg"></div><div class="a" style="right:18px;top:18px;width:42px;height:34px;background:#ddd;border:3px solid #fff;box-shadow:1px 2px 3px #0005;rotate:5deg"></div><svg class="a" style="inset:0" width="100%" height="100%" viewBox="0 0 220 124"><path d="M40 20 L110 84 L182 24" fill="none" stroke="#d62828" stroke-width="1.6" style="stroke-dasharray:400;animation:draw 3s infinite"/><circle cx="40" cy="20" r="3.5" fill="#d62828"/><circle cx="182" cy="24" r="3.5" fill="#d62828"/></svg><div style="position:relative;margin-top:50px;background:#fff59d;padding:5px 10px;box-shadow:1px 2px 3px #0004;rotate:-2deg;font-family:'Courier New',monospace;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px;color:#222">${esc(t)}</div>`,'background-image:radial-gradient(#0002 1px,transparent 1.5px);background-size:6px 6px'),
'pop-info':t=>S('#ffe14d',`<div class="a" style="left:14px;top:50%;margin-top:-28px;width:56px;height:56px;border-radius:50%;background:#ff3d7f;color:#fff;font-weight:800;font-size:26px;display:flex;align-items:center;justify-content:center;box-shadow:4px 4px 0 #111;animation:popW 2.8s infinite">3</div><div style="position:relative;margin-left:76px;text-align:left"><div style="font-weight:800;font-size:${Math.max(13,fs(t)-6)}px;color:#111">${esc(t)}</div><div style="margin-top:6px;height:8px;width:80px;background:#111;transform-origin:left;animation:grow 2.8s .3s infinite both"></div></div>`),
'shadow-puppets':t=>S('radial-gradient(#ffcf7a,#e07b22 70%,#7a3a0a)',`<svg class="a" style="left:12px;bottom:0;animation:sx 4s infinite ease-in-out" width="70" height="70" viewBox="0 0 70 70"><path d="M10 70 L14 40 Q12 22 26 16 L30 6 L34 15 Q48 18 50 34 L62 30 L54 44 L46 44 L48 70Z" fill="#1a0d05"/></svg><div class="a" style="right:30px;bottom:0;width:4px;height:56px;background:#1a0d05"></div><div class="a" style="right:16px;bottom:52px;width:34px;height:34px;border-radius:50% 50% 50% 0;background:#1a0d05;transform-origin:bottom left;animation:arm 2s infinite"></div><div style="position:relative;margin-bottom:40px;font-family:Georgia,serif;font-weight:700;font-size:${fs(t)-4}px;color:#1a0d05">${esc(t)}</div>`),
'visual-novel':t=>S('linear-gradient(#ffd1dc,#c3b1e1 60%,#8e7cc3)',`<div class="a" style="left:50%;top:8px;margin-left:-20px;width:40px;height:62px;border-radius:20px 20px 6px 6px;background:#fff7;animation:rise 3s infinite"></div><div class="a" style="left:8px;right:8px;bottom:8px;height:40px;box-sizing:border-box;background:#1e1b3acc;border:1.5px solid #fff8;border-radius:8px;padding:9px 10px 0;text-align:left;color:#fff;font-size:13px;white-space:nowrap"><span style="position:absolute;top:-9px;left:10px;background:#ff8fab;color:#fff;font-size:10px;padding:1px 8px;border-radius:4px">???</span>${L(t,i=>`animation:tyS 3.4s ${i*.08}s infinite both`)}<span style="font-size:9px;margin-left:4px;animation:blink .8s steps(1) infinite">▼</span></div>`),
'clay-diorama':t=>S('#ffe8d6',`<div style="position:relative;margin-top:30px;animation:rise 3s infinite ease-in-out"><div style="width:150px;height:46px;border-radius:24px;background:radial-gradient(ellipse at 40% 30%,#9ed99e,#5aa95a 70%);box-shadow:inset -6px -8px 12px #2e7d3260,0 10px 14px #0002"></div><div class="a" style="left:16px;top:-30px;width:24px;height:36px;border-radius:50% 50% 40% 40%;background:radial-gradient(circle at 35% 30%,#7ed37e,#2e7d32);box-shadow:inset -3px -4px 6px #0003"></div><div class="a" style="right:18px;top:-20px;width:30px;height:26px;border-radius:8px;background:radial-gradient(circle at 30% 25%,#ffb4a2,#e5989b);box-shadow:inset -3px -4px 6px #0002"></div><div class="a" style="left:50%;top:-44px;transform:translateX(-50%);padding:4px 9px;border-radius:10px;background:radial-gradient(circle at 30% 25%,#fff,#ffd6a5);box-shadow:inset -3px -4px 6px #0002,0 4px 6px #0002;font-family:${RD};font-weight:800;font-size:${Math.max(12,fs(t)-12)}px;color:#c05621;white-space:nowrap">${esc(t)}</div></div>`),
'iso-cutaway':t=>S('#eef2f7',`<svg viewBox="0 0 220 124" width="100%" height="100%"><polygon points="110,62 160,87 110,112 60,87" fill="#e9c46a"/><polygon points="60,87 110,62 110,18 60,43" fill="#a8dadc"/><polygon points="110,62 160,87 160,43 110,18" fill="#7fb7be"/><polygon points="96,82 112,74 128,82 112,90" fill="#e76f51"/><polygon points="96,82 112,90 112,98 96,90" fill="#b5462e"/><polygon points="112,90 128,82 128,90 112,98" fill="#8f3522"/><g style="animation:cutA 3.6s infinite ease-in-out"><polygon points="60,87 110,112 110,68 60,43" fill="#457b9d" stroke="#fff"/><polygon points="110,112 160,87 160,43 110,68" fill="#1d3557" stroke="#fff"/><polygon points="60,43 110,68 160,43 110,18" fill="#a8dadc" stroke="#fff"/></g></svg><div class="a" style="left:10px;top:8px;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px;color:#1d3557">${esc(t)}</div>`),
'exploded-view':t=>S('#f5f5f7',`<div style="position:relative;width:64px;height:64px;margin-top:26px;transform:rotateX(58deg) rotateZ(45deg);transform-style:preserve-3d">${['#adb5bd','#4361ee','#4cc9f0','#f72585'].map((c,i)=>`<div class="a" style="inset:0;border-radius:6px;background:${c};border:1.5px solid #fff;box-shadow:4px 4px 0 #0002;--z:${i*5}px;--z2:${i*24}px;animation:liftZ 3.4s infinite ease-in-out"></div>`).join('')}</div><div class="a" style="right:12px;top:10px;font-size:10px;font-family:var(--font-mono),monospace;color:#666;text-align:right;line-height:1.5">— glass<br>— chip<br>— base</div><div class="a" style="left:10px;top:8px;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px">${esc(t)}</div>`),
'product-turntable':t=>S('radial-gradient(#fff,#dfe3ea)',`<div class="a" style="bottom:14px;width:140px;height:28px;border-radius:50%;background:radial-gradient(#c9cfd8,#9aa3b2);box-shadow:0 6px 10px #0002"></div><div style="position:relative;margin-bottom:22px;width:62px;height:86px;border-radius:12px/7px;background:linear-gradient(90deg,#7a1f1f,#e63946 30%,#ff9a9a 42%,#c1121f 70%,#5c0f0f);overflow:hidden;box-shadow:0 6px 8px #0003"><div style="position:absolute;top:34px;left:0;white-space:nowrap;color:#fff;font-weight:800;font-size:13px;animation:px1 3s linear infinite">${esc(t)} · ${esc(t)} · ${esc(t)} · ${esc(t)} · </div><div style="position:absolute;inset:0;background:linear-gradient(90deg,#0006,transparent 25%,transparent 75%,#0006)"></div></div>`),
'glass-icons':t=>S('linear-gradient(135deg,#a0c4ff,#ffc6ff)',`<div class="a" style="left:18%;top:18%;width:60px;height:60px;border-radius:50%;background:#ff70a6;filter:blur(3px)"></div><div class="a" style="right:16%;bottom:16%;width:50px;height:50px;border-radius:50%;background:#70d6ff;filter:blur(3px)"></div>${[0,1,2].map(i=>`<div style="position:relative;width:46px;height:46px;margin:0 5px 14px;border-radius:14px;background:#ffffff40;backdrop-filter:blur(8px);-webkit-backdrop-filter:blur(8px);border:1px solid #fff9;box-shadow:inset 0 1px 0 #fff,0 8px 16px #0002;display:flex;align-items:center;justify-content:center;font-size:20px;animation:rise 2.6s ${-i*.4}s infinite ease-in-out">${['☕','✦','♥'][i]}</div>`).join('')}<div class="a" style="bottom:8px;font-size:12px;font-weight:600;color:#3a3a6a">${esc(t)}</div>`),
'data-city':t=>{const B=(x,y,h,c,d)=>`<g style="transform-box:fill-box;transform-origin:50% 100%;animation:growY 3.6s ${d}s infinite both"><polygon points="${x-12},${y} ${x},${y+7} ${x},${y+7-h} ${x-12},${y-h}" fill="${c[1]}"/><polygon points="${x},${y+7} ${x+12},${y} ${x+12},${y-h} ${x},${y+7-h}" fill="${c[2]}"/><polygon points="${x-12},${y-h} ${x},${y-7-h} ${x+12},${y-h} ${x},${y+7-h}" fill="${c[0]}"/></g>`;const A=['#bde0fe','#7fb3e6','#3d7cc9'],P=['#ffd6e0','#f497b6','#d65a8a'];return S('#f4f7fb',`<svg viewBox="0 0 220 124" width="100%" height="100%"><polygon points="110,58 180,93 110,124 40,93" fill="#e3e9f2"/>${B(80,86,30,A,0)}${B(104,74,48,A,.15)}${B(128,86,62,P,.3)}${B(104,98,22,A,.45)}${B(152,74,40,A,.6)}</svg><div class="a" style="left:10px;top:8px;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px;color:#1d3557">${esc(t)}</div>`)},
'size-lineup':t=>S('#f4f1ea',`<div class="a" style="left:0;bottom:20px;display:flex;align-items:flex-end;gap:14px;padding-left:20px;animation:pan 5s infinite ease-in-out">${[10,18,28,42,60,84].map((s,i)=>`<div style="width:${s}px;height:${s}px;border-radius:50%;background:radial-gradient(circle at 35% 30%,#fff,${['#8ecae6','#219ebc','#ffb703','#fb8500','#e76f51','#6a4c93'][i]} 60%);box-shadow:0 4px 6px #0002;flex:none"></div>`).join('')}</div><div class="a" style="left:0;right:0;bottom:18px;height:2px;background:#0002"></div><div class="a" style="top:8px;left:12px;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px;color:#333">${esc(t)}</div>`),
'cosmic-scale':t=>S('#05061a',`${[6,24,64,150].map((s,i)=>`<div class="a" style="width:${s}px;height:${s}px;border-radius:50%;border:1px solid ${['#ffd166','#06d6a0','#118ab2','#ef476f'][i]};${i==0?'background:#ffd166;':''}animation:zo 5s infinite ease-in"></div>`).join('')}<div class="a" style="bottom:8px;color:#fff;font-size:12px;letter-spacing:.15em">${esc(t)} · 10²¹ m</div>`,'background-image:radial-gradient(#fff 1px,transparent 1px);background-size:23px 19px'),
'globe-arcs':t=>S('#0b1d3a',`<div class="a" style="width:92px;height:92px;border-radius:50%;background:radial-gradient(circle at 35% 30%,#3a7bd5,#0b2a5b 70%);box-shadow:0 0 24px #3a7bd580;overflow:hidden"><div style="width:200%;height:100%;background:repeating-linear-gradient(90deg,transparent 0 14px,#ffffff20 14px 15px);animation:px1 6s linear infinite"></div></div><svg class="a" style="inset:0" width="100%" height="100%" viewBox="0 0 220 124"><path d="M80 70 Q110 0 145 55" fill="none" stroke="#ffd166" stroke-width="2" style="stroke-dasharray:400;animation:draw 2.4s infinite"/><path d="M88 86 Q130 40 150 80" fill="none" stroke="#06d6a0" stroke-width="2" style="stroke-dasharray:400;animation:draw 2.4s .6s infinite both"/></svg><div class="a" style="bottom:4px;color:#cfe3ff;font-size:12px;font-weight:600">${esc(t)}</div>`),
'physics-toybox':t=>S('#fdf6ec',`<div class="a" style="left:0;right:0;bottom:26px;height:3px;background:#333"></div><div style="position:relative;margin-top:36px;font-family:${RD};font-weight:800;font-size:${fs(t)}px">${L(t,i=>`color:${['#ef476f','#ffb703','#06d6a0','#118ab2'][i%4]};animation:drop 2.8s ${i*.09}s infinite both cubic-bezier(.3,0,.7,1)`)}</div>`),
'deep-layers':t=>S('#0d0d0d',`${[0,1,2,3].map(i=>`<div class="a" style="width:120px;height:68px;border:2px solid ${['#ff006e','#8338ec','#3a86ff','#06d6a0'][i]};border-radius:8px;animation:zoomIn 3.2s ${-i*.8}s infinite linear"></div>`).join('')}<div style="position:relative;color:#fff;font-weight:700;font-size:${fs(t)-4}px;text-shadow:0 0 10px #8338ec">${esc(t)}</div>`),
'bio-glow':t=>S('radial-gradient(#0a2a4a,#020814)',`${[[24,24,22],[150,64,16],[70,84,10],[176,18,8]].map(([x,y,s],i)=>`<div class="a" style="left:${x}px;top:${y}px;width:${s}px;height:${s}px;border-radius:50%;background:radial-gradient(#9ffcff,#00e5ff55 60%,transparent 70%);box-shadow:0 0 ${s}px #00e5ff;animation:pg ${2+i*.5}s ${-i*.4}s infinite ease-in-out"></div>`).join('')}<div style="position:relative;color:#b8fbff;font-weight:600;font-size:${fs(t)-2}px;text-shadow:0 0 8px #00e5ff,0 0 18px #00e5ff;animation:pg 3s infinite ease-in-out">${esc(t)}</div>`),
'low-poly-atlas':t=>S('#bde0fe',`<svg class="a" style="inset:0" width="100%" height="100%" viewBox="0 0 220 124" preserveAspectRatio="none"><polygon points="0,124 40,70 80,124" fill="#52b788"/><polygon points="40,70 80,124 95,80" fill="#40916c"/><polygon points="80,124 95,80 140,124" fill="#74c69d"/><polygon points="95,80 130,50 140,124" fill="#2d6a4f"/><polygon points="130,50 140,124 180,90" fill="#95d5b2"/><polygon points="130,50 150,40 180,90" fill="#e9f5ec"/><polygon points="140,124 180,90 220,124" fill="#40916c"/><polygon points="180,90 220,70 220,124" fill="#52b788"/></svg><div class="a" style="left:58%;top:16px;font-size:20px;animation:hop 1.6s infinite">📍</div><div class="a" style="left:12px;top:8px;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px;color:#1b4332">${esc(t)}</div>`),
'synth-grid':t=>S('linear-gradient(#1a0033,#3d0066 58%,#0d0019 58%)',`<div class="a" style="top:10px;width:68px;height:68px;border-radius:50%;background:linear-gradient(#ffd319,#ff2975 75%);-webkit-mask:linear-gradient(#000 0 52%,transparent 52% 58%,#000 58% 68%,transparent 68% 74%,#000 74% 82%,transparent 82% 87%,#000 87%);mask:linear-gradient(#000 0 52%,transparent 52% 58%,#000 58% 68%,transparent 68% 74%,#000 74% 82%,transparent 82% 87%,#000 87%)"></div><div class="a" style="left:-60%;right:-60%;bottom:0;height:52px;background-image:linear-gradient(#ff2975 1.5px,transparent 1.5px),linear-gradient(90deg,#ff2975 1.5px,transparent 1.5px);background-size:24px 12px;transform:perspective(90px) rotateX(50deg);transform-origin:bottom;animation:gridMv .5s linear infinite"></div><div style="position:relative;margin-top:24px;font-weight:900;font-style:italic;font-size:${fs(t)}px;background:linear-gradient(#e0f7ff,#6ec3ff 48%,#1a1a6e 50%,#ff9ef5);-webkit-background-clip:text;background-clip:text;color:transparent;filter:drop-shadow(0 0 6px #ff2975)">${esc(t)}</div>`),
'terminal':t=>S('#0c0c0c',`<div class="a" style="top:0;left:0;right:0;height:16px;background:#2a2a2a;display:flex;gap:4px;align-items:center;padding-left:6px">${['#ff5f56','#ffbd2e','#27c93f'].map(c=>`<i style="width:7px;height:7px;border-radius:50%;background:${c}"></i>`).join('')}</div><div style="position:relative;margin-top:10px;text-align:left;font-family:var(--font-mono),monospace;font-size:${Math.max(13,fs(t)-8)}px;color:#33ff66;text-shadow:0 0 6px #33ff6688;width:86%;white-space:nowrap;overflow:hidden"><div style="opacity:.6;font-size:11px">~/motion $ render</div><span>&gt; </span>${L(t,i=>`animation:tyS 3.6s ${i*.09}s infinite both`)}<span style="animation:blink .7s steps(1) infinite">▋</span></div>`),
'doc-cinema':t=>S('#111',`<div class="a" style="inset:14px 0;background:radial-gradient(circle at 62% 40%,#c8c8c8,#5a5a5a 55%,#1f1f1f);animation:kb 6s infinite ease-in-out"><div style="position:absolute;inset:0;background-image:radial-gradient(#fff3 1px,transparent 1px);background-size:3px 3px;animation:jit .2s steps(2) infinite"></div></div><div class="a" style="left:0;right:0;top:0;height:14px;background:#000"></div><div class="a" style="left:0;right:0;bottom:0;height:14px;background:#000"></div><div class="a" style="left:14px;bottom:22px;text-align:left;color:#fff;animation:fadeT 6s infinite"><div style="font-family:Georgia,serif;font-size:${Math.max(13,fs(t)-8)}px">${esc(t)}</div><div style="font-size:10px;letter-spacing:.2em;opacity:.7">SEOUL, 1987</div></div>`),
'quote-cinema':t=>S('#0a0a0a',`<div class="a" style="left:12px;top:-8px;font-family:Georgia,serif;font-size:70px;color:#c9a227;opacity:.5">“</div><div style="position:relative;text-align:center"><div style="font-family:Georgia,'Nanum Myeongjo',serif;font-style:italic;font-size:${fs(t)-4}px;color:#f5f0e6">${t.split(/\s+/).map((w,i)=>`<span style="display:inline-block;margin:0 3px;animation:fadeT 4.5s ${i*.35}s infinite both">${esc(w)}</span>`).join('')}</div><div style="margin-top:8px;font-size:11px;letter-spacing:.25em;color:#c9a227;animation:fadeT 4.5s .9s infinite both">— MOTION</div></div>`),
'blueprint':t=>S('#0d3b66',`<svg class="a" style="inset:0" width="100%" height="100%" viewBox="0 0 220 124"><g fill="none" stroke="#e0f0ff" stroke-width="1.3" style="stroke-dasharray:400;animation:draw 3.6s infinite"><rect x="62" y="30" width="96" height="52"/><circle cx="110" cy="56" r="15"/><path d="M110 36V76M90 56H130"/><path d="M62 94H158M62 90V98M158 90V98"/></g><text x="110" y="110" text-anchor="middle" font-family="monospace" font-size="8" fill="#e0f0ff">96 mm</text></svg><div class="a" style="top:8px;left:10px;font-family:var(--font-mono),monospace;font-size:${Math.max(11,fs(t)-14)}px;color:#e0f0ff;letter-spacing:.1em;text-transform:uppercase">${esc(t)}</div>`,'background-image:linear-gradient(#ffffff1c 1px,transparent 1px),linear-gradient(90deg,#ffffff1c 1px,transparent 1px);background-size:10px 10px'),
'isotype':t=>{let p='';for(let i=0;i<20;i++){const c=i<13?'#e63946':'#1d3557';p+=`<div style="width:10px;display:flex;flex-direction:column;align-items:center;animation:tyS 4s ${i*.08}s infinite both"><i style="width:7px;height:7px;border-radius:50%;background:${c}"></i><i style="width:10px;height:11px;border-radius:4px 4px 1px 1px;margin-top:1px;background:${c}"></i></div>`}return S('#f1faee',`<div style="text-align:left"><div style="font-weight:700;font-size:${Math.max(12,fs(t)-10)}px;color:#1d3557;margin-bottom:6px">${esc(t)} — 65%</div><div style="display:grid;grid-template-columns:repeat(10,10px);gap:4px 6px">${p}</div></div>`)},
'timeline-rail':t=>S('#fff',`<div class="a" style="left:0;top:58px;display:flex;align-items:center;animation:pan 6s infinite ease-in-out"><div style="position:absolute;left:0;right:0;top:50%;height:2px;background:#ccc"></div>${['1998','2005','2014','2020','2026'].map((y,i)=>`<div style="position:relative;width:70px;flex:none;text-align:center"><div style="width:12px;height:12px;margin:0 auto;border-radius:50%;background:${i==4?'#e63946':'#1d3557'};border:2px solid #fff;box-shadow:0 0 0 2px ${i==4?'#e63946':'#1d3557'}"></div><div style="position:absolute;top:${i%2?20:-24}px;left:0;right:0;font-size:11px;font-weight:600;color:#444">${y}</div></div>`).join('')}</div><div class="a" style="top:8px;left:12px;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px">${esc(t)}</div>`),
'math-canvas':t=>S('#141a24',`<svg class="a" style="inset:0" width="100%" height="100%" viewBox="0 0 220 124"><path d="M20 72H204M30 24V116" stroke="#ffffff55" stroke-width="1"/><path id="mcp" d="M30 72 C45 32 60 32 75 72 S105 112 120 72 S150 32 165 72 S195 112 204 92" fill="none" stroke="#58c4dd" stroke-width="2.5" style="stroke-dasharray:400;animation:draw 3s infinite"/><circle r="4" fill="#fc6255"><animateMotion dur="3s" repeatCount="indefinite" path="M30 72 C45 32 60 32 75 72 S105 112 120 72 S150 32 165 72 S195 112 204 92"/></circle></svg><div class="a" style="top:6px;right:12px;font-family:'Times New Roman',serif;font-style:italic;color:#fff;font-size:14px">y = sin x</div><div class="a" style="top:6px;left:12px;color:#ffff77;font-size:${Math.max(12,fs(t)-10)}px">${esc(t)}</div>`),
'tactics-board':t=>S('#2d6a4f',`<svg class="a" style="inset:0" width="100%" height="100%" viewBox="0 0 220 124"><rect x="8" y="8" width="204" height="108" fill="none" stroke="#ffffffaa"/><path d="M110 8V116" stroke="#ffffffaa"/><circle cx="110" cy="62" r="18" fill="none" stroke="#ffffffaa"/><g font-family="sans-serif" font-weight="700" font-size="14"><text x="46" y="40" fill="#fff">X</text><text x="56" y="92" fill="#fff">X</text><text x="160" y="50" fill="#ffd166">O</text><text x="150" y="98" fill="#ffd166">O</text></g><path d="M58 34 Q100 8 140 40" fill="none" stroke="#fff" stroke-width="2" stroke-dasharray="4 3" style="animation:dashMv 1s linear infinite"/><path d="M68 86 Q110 112 142 70" fill="none" stroke="#ff6b6b" stroke-width="2.5" style="stroke-dasharray:400;animation:draw 2.8s infinite"/></svg><div class="a" style="bottom:12px;right:14px;color:#fff;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px">${esc(t)}</div>`),
'market-tape':t=>{const c=[[20,50,30],[40,40,25],[60,55,30],[80,30,20],[100,38,26],[120,25,22],[140,32,18],[160,20,24],[180,14,20],[200,10,16]];return S('#0b0f14',`<svg class="a" style="left:0;top:0" width="100%" height="100" viewBox="0 0 220 100">${c.map(([x,y,h],i)=>`<g style="animation:tyS 4s ${i*.15}s infinite both"><line x1="${x}" y1="${y-6}" x2="${x}" y2="${y+h+6}" stroke="${i%3==1?'#ef476f':'#06d6a0'}"/><rect x="${x-5}" y="${y}" width="10" height="${h}" fill="${i%3==1?'#ef476f':'#06d6a0'}"/></g>`).join('')}</svg><div class="a" style="left:0;right:0;bottom:0;height:22px;background:#151b23;overflow:hidden;display:flex;align-items:center"><div style="white-space:nowrap;font-family:var(--font-mono),monospace;font-size:11px;color:#ddd;animation:px1 6s linear infinite">${[0,1].map(()=>`${esc(t)} <b style="color:#06d6a0">▲ 4.2%</b> · KOSPI <b style="color:#ef476f">▼ 0.8%</b> · NASDAQ <b style="color:#06d6a0">▲ 1.1%</b> · `).join('')}</div></div>`)},
'quiz-countdown':t=>S('#4361ee',`<div class="a" style="top:8px;right:10px"><svg viewBox="0 0 36 36" width="30" height="30"><circle cx="18" cy="18" r="15" fill="#fff2" stroke="#fff3" stroke-width="4"/><circle cx="18" cy="18" r="15" fill="none" stroke="#ffd166" stroke-width="4" stroke-dasharray="95" transform="rotate(-90 18 18)" style="animation:ring 5s linear infinite"/></svg></div><div style="width:84%"><div style="color:#fff;font-weight:700;font-size:${Math.max(13,fs(t)-10)}px;margin-bottom:8px">${esc(t)}?</div><div style="display:grid;grid-template-columns:1fr 1fr;gap:5px">${['A','B','C','D'].map((o,i)=>`<div style="background:#fff;border-radius:6px;padding:4px;font-size:11px;font-weight:600;color:#333;${i==2?'animation:ans 5s infinite':''}">${o}</div>`).join('')}</div></div>`),
'top5-countdown':t=>S('#111',`<div style="display:flex;align-items:center;gap:12px"><div style="height:64px;overflow:hidden"><div style="animation:cnt 5s steps(5) infinite">${[5,4,3,2,1].map(n=>`<div style="height:64px;line-height:64px;font-size:58px;font-weight:900;color:#ffd166;-webkit-text-stroke:2px #fff">${n}</div>`).join('')}</div></div><div style="text-align:left;color:#fff"><div style="font-size:11px;letter-spacing:.2em;opacity:.7">TOP 5</div><div style="font-weight:700;font-size:${Math.max(13,fs(t)-8)}px">${esc(t)}</div></div></div>`),
'tier-list':t=>S('#1e1e1e',`<div style="width:90%;display:grid;gap:3px">${[['S','#ff7f7f'],['A','#ffbf7f'],['B','#ffff7f']].map(([r,c],i)=>`<div style="display:flex;gap:3px;height:30px"><div style="width:30px;background:${c};display:flex;align-items:center;justify-content:center;font-weight:800;color:#222">${r}</div><div style="flex:1;background:#2c2c2c;display:flex;gap:3px;padding:3px">${i==0?`<div style="padding:0 6px;background:#fff;border-radius:3px;font-size:11px;font-weight:700;display:flex;align-items:center;white-space:nowrap;animation:tierD 3s infinite both">${esc(t)}</div>`:''}${[0,1,2].slice(0,i+1).map(()=>`<div style="width:24px;background:#555;border-radius:3px"></div>`).join('')}</div></div>`).join('')}</div>`),
'chat-story':t=>S('#e5ddd5',`<div style="width:86%;display:flex;flex-direction:column;gap:5px;font-size:12px">${[[0,G==='ko'?'오늘 뭐 해?':'what\'s the plan?'],[1,t],[0,G==='ko'?'ㅋㅋ 좋아 👍':'lol yes 👍']].map(([me,x],i)=>`<div style="align-self:${me?'flex-end':'flex-start'};max-width:80%;padding:5px 9px;border-radius:12px;background:${me?'#dcf8c6':'#fff'};box-shadow:0 1px 1px #0002;animation:bub 4.5s ${i*.7}s infinite both">${esc(x)}</div>`).join('')}</div>`),
'versus-split':t=>S('#000',`<div class="a" style="left:0;top:0;bottom:0;width:53%;background:#e63946;clip-path:polygon(0 0,100% 0,86% 100%,0 100%);animation:vsL 3s infinite"></div><div class="a" style="right:0;top:0;bottom:0;width:53%;background:#457b9d;clip-path:polygon(14% 0,100% 0,100% 100%,0 100%);animation:vsR 3s infinite"></div><div class="a" style="left:10px;bottom:10px;color:#fff;font-weight:800;font-size:${Math.max(12,fs(t)-10)}px">${esc(t)}</div><div class="a" style="right:14px;bottom:10px;color:#fff;font-weight:800;font-size:13px">???</div><div style="position:relative;width:44px;height:44px;border-radius:50%;background:#ffd166;color:#111;font-weight:900;font-size:17px;display:flex;align-items:center;justify-content:center;box-shadow:0 0 0 3px #000;animation:pop 3s infinite">VS</div>`),
'myth-or-fact':t=>S('#f1f3f5',`<div style="position:relative;width:150px;height:84px;perspective:400px"><div style="position:absolute;inset:0;transform-style:preserve-3d;animation:flipC 4s infinite ease-in-out">${[['MYTH','#ef476f',''],['FACT','#06d6a0','transform:rotateY(180deg);']].map(([w,c,x])=>`<div style="position:absolute;inset:0;backface-visibility:hidden;${x}border-radius:10px;background:${c};color:#fff;display:flex;flex-direction:column;align-items:center;justify-content:center"><b style="font-size:20px;letter-spacing:.1em">${w}</b><small style="font-size:11px">${esc(t)}</small></div>`).join('')}</div></div>`),
'recipe-steps':t=>S('#fff8f0',`<div style="display:flex;gap:6px;margin-top:14px">${['🥛','☕','🧊'].map((e,i)=>`<div style="width:56px;padding:6px 0;border-radius:10px;background:#fff;box-shadow:0 2px 6px #0001;border:1.5px solid #f4a261;animation:card 4s ${i*.4}s infinite both"><div style="font-size:10px;font-weight:700;color:#e76f51">STEP ${i+1}</div><div style="font-size:22px">${e}</div></div>`).join('')}</div><div class="a" style="top:6px;left:10px;font-weight:700;font-size:${Math.max(12,fs(t)-12)}px;color:#6b3e26">${esc(t)}</div>`),
'breaking-desk':t=>S('linear-gradient(#1b263b,#0d1b2a)',`<div class="a" style="left:0;right:0;bottom:24px;display:flex;animation:lt 4s infinite both"><div style="background:#d00000;color:#fff;font-weight:900;font-size:12px;padding:6px 8px;letter-spacing:.05em">BREAKING</div><div style="flex:1;background:#fff;color:#111;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px;padding:5px 8px;white-space:nowrap;overflow:hidden">${esc(t)}</div></div><div class="a" style="left:0;right:0;bottom:0;height:22px;background:#0b132b;overflow:hidden;display:flex;align-items:center"><div style="white-space:nowrap;font-size:11px;color:#ffd166;animation:px1 7s linear infinite">${'LIVE · 속보 · UPDATE · 09:41 · '.repeat(4)}</div></div><div class="a" style="top:10px;right:10px;font-size:10px;font-weight:700;color:#fff;background:#d00000;padding:2px 6px;border-radius:3px;animation:blink 1s steps(1) infinite">● LIVE</div>`),
'podcast-clip':t=>S('#1f1f2e',`<div style="display:flex;align-items:center;gap:10px;margin-bottom:20px"><div style="width:46px;height:46px;border-radius:50%;background:radial-gradient(circle at 40% 35%,#ffd6a5,#e76f51);box-shadow:0 0 0 3px #ffffff22"></div><div style="display:flex;align-items:center;gap:3px;height:40px">${Array.from({length:14},(_,i)=>`<i style="width:4px;border-radius:2px;background:#9b5de5;--h:${10+((i*29)%26)}px;animation:bar ${.6+(i%4)*.15}s ${-i*.1}s infinite ease-in-out"></i>`).join('')}</div></div><div class="a" style="bottom:10px;left:0;right:0;color:#fff;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px"><span style="background:#000a;padding:2px 8px;border-radius:4px">${esc(t)}</span></div>`),
'punch-captions':t=>{const w=t.split(/\s+/);return S('linear-gradient(#6c757d,#343a40)',`<div style="font-family:Impact,'Arial Black',sans-serif;font-size:${fs(t)}px;text-transform:uppercase;color:#fff;-webkit-text-stroke:3px #000;paint-order:stroke;text-shadow:0 3px 0 #000">${w.map((x,i)=>`<span style="display:inline-block;margin:0 3px;${i==w.length-1?'color:#ffe600;':''}animation:pop 2.4s ${i*.25}s infinite both">${esc(x)}</span>`).join('')}</div>`)},
'karaoke-subs':t=>S('linear-gradient(#2b2d42,#000)',`<div style="font-weight:800;font-size:${fs(t)}px;background:linear-gradient(90deg,#ff4d8d,#ff4d8d) no-repeat,linear-gradient(#fff,#fff);background-size:0 100%,100% 100%;-webkit-background-clip:text;background-clip:text;color:transparent;animation:kf 3s linear infinite">${esc(t)}</div><div class="a" style="bottom:12px;font-size:11px;color:#fff8">♪ 0:12 / 3:45</div>`),
'callout-kit':t=>S('#dfe7ef',`<div class="a" style="left:calc(50% - 44px);top:52px;width:40px;height:40px;border-radius:8px;background:#adb5bd"></div><svg class="a" style="inset:0" width="100%" height="100%" viewBox="0 0 220 124"><ellipse cx="86" cy="72" rx="30" ry="24" fill="none" stroke="#ff006e" stroke-width="3" style="stroke-dasharray:400;animation:draw 3s infinite"/><path d="M116 56 L148 34" stroke="#ff006e" stroke-width="3" stroke-linecap="round" style="stroke-dasharray:400;animation:draw 3s .4s infinite both"/></svg><div class="a" style="right:10px;top:12px;background:#ff006e;color:#fff;font-weight:700;font-size:${Math.max(12,fs(t)-10)}px;padding:3px 9px;border-radius:6px;animation:popW 3s .8s infinite both">${esc(t)}</div>`),
'lower-thirds':t=>S('linear-gradient(135deg,#8d99ae,#2b2d42)',`<div class="a" style="left:12px;bottom:18px;text-align:left;overflow:hidden"><div style="animation:lt 4s infinite both"><div style="display:inline-block;background:#fff;color:#111;font-weight:800;font-size:${Math.max(13,fs(t)-8)}px;padding:3px 10px;border-left:5px solid #ef233c">${esc(t)}</div><br><div style="display:inline-block;background:#ef233c;color:#fff;font-size:10px;padding:2px 10px;letter-spacing:.08em">${G==='ko'?'바리스타 · 서울':'BARISTA · SEOUL'}</div></div></div>`),
'headline-backdrop':t=>S('linear-gradient(#a3b18a,#588157)',`<div style="max-width:86%;line-height:1.5"><span style="background:#fff;color:#111;font-weight:800;font-size:${Math.max(13,fs(t)-6)}px;padding:2px 8px;border-radius:6px;display:inline-block;animation:popW 3s infinite both">${esc(t)}</span><br><span style="background:#ffe600;color:#111;font-weight:800;font-size:13px;padding:2px 8px;border-radius:6px;display:inline-block;margin-top:4px;animation:popW 3s .3s infinite both">${G==='ko'?'이거 모르면 손해':'you need this'}</span></div>`),
'stack-split':t=>S('#000',`<div class="a" style="left:0;right:0;top:0;height:50%;background:linear-gradient(135deg,#ffcdb2,#e5989b);display:flex;align-items:center;justify-content:center;font-weight:800;font-size:${Math.max(12,fs(t)-10)}px;color:#4a2c2a">${esc(t)}</div><div class="a" style="left:0;right:0;bottom:0;height:50%;overflow:hidden;background:#2b9348"><div style="position:absolute;top:0;bottom:0;left:0;width:200%;background:repeating-linear-gradient(90deg,#55a630 0 20px,#80b918 20px 40px);animation:px1 2s linear infinite"></div><div style="position:absolute;left:40%;top:30%;width:18px;height:18px;background:#ffd60a;border-radius:4px;animation:hop .6s infinite"></div></div><div class="a" style="left:0;right:0;top:calc(50% - 1px);height:2px;background:#fff"></div>`),
'sticker-pop':t=>S('#cdb4db',`${[['☕',12,10],['✨',168,16],['👍',24,80],['🔥',160,76]].map(([e,x,y],i)=>`<div class="a" style="left:${x}px;top:${y}px;font-size:24px;filter:drop-shadow(2px 0 0 #fff) drop-shadow(-2px 0 0 #fff) drop-shadow(0 2px 0 #fff) drop-shadow(0 -2px 0 #fff);animation:pop 2.8s ${i*.3}s infinite both">${e}</div>`).join('')}<div style="position:relative;background:#fff;color:#7b2cbf;font-weight:800;font-size:${fs(t)-6}px;padding:4px 12px;border-radius:12px;box-shadow:0 3px 0 #7b2cbf;rotate:-4deg;animation:popW 2.8s infinite">${esc(t)}</div>`),
'feel-smooth':FE('ease-in-out','60 fps · on ones','#3a86ff'),
'feel-twos':FE('steps(14)','12 fps · on twos','#8338ec'),
'feel-threes':FE('steps(10)','8 fps · on threes','#ff006e'),
'feel-stepped':FE('steps(3)','pose to pose','#fb5607'),
'feel-stroke':t=>S('#fff',`<svg viewBox="0 0 220 124" width="100%" height="100%"><g fill="none" stroke="#222" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"><path d="M62 92 L88 32" style="stroke-dasharray:400;animation:stk 4s steps(6) infinite both"/><path d="M88 32 L114 92" style="stroke-dasharray:400;animation:stk 4s .5s steps(6) infinite both"/><path d="M73 68 H103" style="stroke-dasharray:400;animation:stk 4s 1s steps(4) infinite both"/><path d="M134 92 V32 Q166 30 164 48 Q162 60 134 61 Q172 62 168 80 Q164 93 134 92" style="stroke-dasharray:400;animation:stk 4s 1.5s steps(8) infinite both"/></g><text x="12" y="16" font-size="10" font-family="monospace" fill="#666">stroke by stroke</text></svg>`)
};
const D=[['kinetic-type','키네틱 타이포','가사 영상, 숏폼 광고 오프닝','Kinetic typography','lyric videos, short-form ad openers'],['flat-2d','플랫 2D','앱 사용법, 서비스 소개 영상','Flat 2D','app how-tos, product explainers'],['line-art','라인아트','미니멀 브랜드 인트로','Line art','minimal brand intros'],['infographic','인포그래픽','뉴스·리포트, 실적 발표 영상','Infographic','news, reports, earnings videos'],['whiteboard-doodle','화이트보드 손그림','유튜브 지식 채널, 온라인 강의','Whiteboard doodle','explainer channels, online courses'],['liquid-morph','리퀴드 모프','음악 앱·뷰티 브랜드 광고','Liquid morph','music apps, beauty brand ads'],['paper-collage','콜라주·컷아웃','패션·아트 매거진 SNS','Paper collage','fashion and art magazine socials'],['rubber-hose','러버호스 카툰','옛날 만화풍 브랜드 캠페인','Rubber hose cartoon','vintage-cartoon brand campaigns'],['frame-by-frame','프레임바이프레임','손그림 애니 뮤비, 인디 광고','Frame-by-frame','hand-drawn music videos, indie ads'],['glitch','글리치','게임·테크 티저, 힙합 뮤비','Glitch','game and tech teasers, hip-hop videos'],['retro-vhs','레트로 VHS','레트로 뮤비, 빈티지 숍 릴스','Retro VHS','retro music videos, vintage shop reels'],['pixel-8bit','픽셀 8비트','게임 런칭, 레트로 이벤트 공지','Pixel 8-bit','game launches, retro event promos'],['neon-cyber','네온 사이버','게임·e스포츠, 나이트 이벤트','Neon cyber','gaming, esports, night events'],['particle-abstract','파티클 추상','테크 컨퍼런스 오프닝','Particle abstract','tech conference openers'],['geometric-minimal','미니멀 기하','디자인 에이전시 로고 리빌','Geometric minimal','design agency logo reveals'],['swiss-grid','스위스 그리드','디자인 전시, 테크 기업 발표','Swiss grid','design shows, tech keynotes'],['duotone-pop','듀오톤 팝','음악 페스티벌, 스트리트 브랜드 릴스','Duotone pop','music festivals, streetwear reels'],['watercolor','수채화','웨딩·여행 브이로그 인트로','Watercolor','wedding and travel vlog intros'],['risograph-grain','리소그래프','독립출판, 카페·전시 포스터','Risograph','zines, café and exhibition posters'],['ui-motion','UI 모션','앱 출시 광고, 기능 소개','UI motion','app launch ads, feature tours'],['parallax-2-5d','2.5D 패럴랙스','여행·게임 타이틀 화면','2.5D parallax','travel and game title screens'],['isometric','아이소메트릭','스타트업 서비스 소개','Isometric','startup product explainers'],['3d-clay','3D 클레이','귀여운 캐릭터 광고, 생활 앱 SNS','3D clay','cute character ads, lifestyle app socials'],['clay-stopmotion','스톱모션 클레이','어린이 콘텐츠, 손맛 캠페인','Claymation','kids content, handmade campaigns'],['glass-3d','글래스 3D','핀테크·AI 서비스 소개','Glass 3D','fintech and AI product videos'],['chrome-metal','크롬·메탈','전자기기 런칭, Y2K 패션 브랜드','Chrome / metal','gadget launches, Y2K fashion'],['3d-type','3D 타이포','유튜브 채널 오프닝, 이벤트 타이틀','3D typography','channel openers, event titles'],['low-poly','로우폴리','게임·아웃도어 브랜드','Low-poly','game and outdoor brands'],['inflatable','인플레이터블','장난감·음료 브랜드 숏폼','Inflatable','toy and drink brand shorts'],['jelly-softbody','젤리·소프트바디','디저트·뷰티 신제품 숏폼','Jelly / soft-body','dessert and beauty launch shorts']];
D.push(...[
['ink-wash','수묵화','차·한방 브랜드, 동양풍 다큐','Ink wash','tea brands, East Asian documentaries'],
['ukiyo-e','우키요에 목판화','일본풍 브랜드, 역사 설명 영상','Ukiyo-e woodblock','Japanese-style brands, history explainers'],
['stained-glass','스테인드글라스','성당·역사 이야기, 판타지 게임','Stained glass','cathedral and history stories, fantasy games'],
['mosaic','모자이크 타일','고대 문명 다큐, 박물관 홍보','Mosaic tiles','ancient-history docs, museum promos'],
['storybook','동화책','어린이 콘텐츠, 브랜드 스토리','Storybook','kids content, brand stories'],
['nature-notebook','자연 관찰 노트','과학·생물 채널, 친환경 브랜드','Nature notebook','science and biology channels, eco brands'],
['calligraphy-draw','붓글씨 드로잉','명절 인사, 전통 브랜드 로고','Brush calligraphy','holiday greetings, heritage brand logos'],
['paper-craft','페이퍼 크래프트','키즈·교육 앱, 따뜻한 브랜드 광고','Paper craft','kids and education apps, warm brand ads'],
['zine-collage','진 콜라주','인디 밴드, 스트리트 패션','Zine collage','indie bands, streetwear'],
['retro-scrapbook','레트로 스크랩북','여행 브이로그, 추억 영상','Retro scrapbook','travel vlogs, memory reels'],
['comic-panels','만화 컷','웹툰 홍보, 재미있는 설명 영상','Comic panels','webtoon promos, fun explainers'],
['parchment-map','양피지 지도','여행 경로, 판타지·역사 이야기','Parchment map','travel routes, fantasy and history'],
['evidence-board','수사 보드','미스터리·사건 채널','Evidence board','true-crime and mystery channels'],
['pop-info','팝 인포','꿀팁 숏폼, 리스트형 정보','Pop info','tip shorts, listicles'],
['shadow-puppets','그림자극','전설·옛이야기, 감성 광고','Shadow puppets','legends and folk tales, moody ads'],
['visual-novel','비주얼 노벨','게임 홍보, 스토리텔링 숏폼','Visual novel','game promos, story shorts'],
['clay-diorama','클레이 디오라마','매장·동네 소개, 귀여운 브랜드 월드','Clay diorama','shop and neighbourhood intros, cute brand worlds'],
['iso-cutaway','아이소 단면도','건물·공장 내부 설명','Isometric cutaway','inside buildings and factories'],
['exploded-view','분해도','제품 구조, 하드웨어 런칭','Exploded view','product anatomy, hardware launches'],
['product-turntable','제품 턴테이블','신제품 360° 소개','Product turntable','360° product showcases'],
['glass-icons','글래스 아이콘','앱 기능 소개, AI 서비스','Glass icons','app features, AI products'],
['data-city','데이터 시티','통계·성장 리포트','Data city','stats and growth reports'],
['size-lineup','크기 비교 라인업','크기·규모 비교 숏폼','Size lineup','size-comparison shorts'],
['cosmic-scale','우주 스케일 줌','과학 채널, 규모 줌아웃','Cosmic scale zoom','science channels, zoom-outs'],
['globe-arcs','지구본 경로','글로벌 물류, 여행 루트','Globe arcs','global logistics, travel routes'],
['physics-toybox','물리 장난감','통통 튀는 타이틀, 키즈 광고','Physics toybox','bouncy titles, kids ads'],
['deep-layers','깊이 레이어','몰입형 오프닝, 음악 비주얼','Deep layers','immersive openers, music visuals'],
['bio-glow','바이오 글로우','심해·생명과학, 뷰티 테크','Bio glow','deep sea and biotech, beauty tech'],
['low-poly-atlas','로우폴리 지도','여행·게임 월드맵','Low-poly atlas','travel and game world maps'],
['synth-grid','신스웨이브 그리드','80년대 레트로 음악, 게임','Synthwave grid','80s retro music, games'],
['terminal','터미널','개발자 채널, 해킹·테크 티저','Terminal','dev channels, hacker-tech teasers'],
['doc-cinema','다큐 시네마','역사 다큐, 브랜드 헤리티지','Documentary cinema','history docs, brand heritage'],
['quote-cinema','명언 시네마','명언·인용 숏폼','Quote cinema','quote shorts'],
['blueprint','블루프린트','설계·엔지니어링 설명','Blueprint','engineering explainers'],
['isotype','아이소타입 픽토그램','인구·비율 통계','Isotype pictograms','population and ratio stats'],
['timeline-rail','타임라인 레일','연혁, 역사 흐름','Timeline rail','company history, chronologies'],
['math-canvas','수학 캔버스','수학·과학 강의 (3Blue1Brown 느낌)','Math canvas','math and science lessons (3Blue1Brown feel)'],
['tactics-board','전술 보드','스포츠 분석, 전략 설명','Tactics board','sports breakdowns, strategy'],
['market-tape','마켓 테이프','주식·코인 뉴스','Market tape','stock and crypto news'],
['quiz-countdown','퀴즈 카운트다운','퀴즈 숏폼, 참여형 릴스','Quiz countdown','quiz shorts, interactive reels'],
['top5-countdown','TOP 5 카운트다운','순위 숏폼','Top-5 countdown','ranking shorts'],
['tier-list','티어 리스트','등급 매기기 영상','Tier list','ranking videos'],
['chat-story','채팅 스토리','카톡 썰, 대화형 광고','Chat story','text-message stories, chat ads'],
['versus-split','VS 대결','비교·대결 숏폼','Versus split','comparison shorts'],
['myth-or-fact','진짜? 가짜?','상식 퀴즈, 오해 바로잡기','Myth or fact','myth-busting shorts'],
['recipe-steps','레시피 스텝','요리·DIY 순서 안내','Recipe steps','cooking and DIY how-tos'],
['breaking-desk','속보 데스크','뉴스 패러디, 공지','Breaking news desk','news-style announcements'],
['podcast-clip','팟캐스트 클립','인터뷰·팟캐스트 하이라이트','Podcast clip','interview and podcast highlights'],
['punch-captions','펀치 자막','쇼츠·릴스 말자막','Punch captions','Shorts and Reels captions'],
['karaoke-subs','노래방 자막','가사·말에 맞춰 채워지는 자막','Karaoke subtitles','lyrics that fill as they are sung'],
['callout-kit','콜아웃 강조','동그라미·화살표 강조','Callouts','circles and arrows'],
['lower-thirds','로어서드 이름 자막','인터뷰 이름·직함','Lower thirds','interview name and title bars'],
['headline-backdrop','박스 헤드라인','틱톡식 박스 자막','Boxed headline','TikTok-style boxed text'],
['stack-split','위아래 분할','리액션·게임 플레이 분할','Stacked split','reaction and gameplay splits'],
['sticker-pop','스티커 팝','이모지 스티커 장식','Sticker pop','emoji sticker accents'],
['feel-smooth','부드럽게 (매 프레임)','앱 UI, 고급 브랜드','Smooth (on ones)','app UI, premium brands'],
['feel-twos','투스 (12fps)','스파이더버스, 손그림 애니','On twos (12 fps)','Spider-Verse look, hand-drawn anime'],
['feel-threes','쓰리스 (8fps)','목판화·종이 애니, 레트로','On threes (8 fps)','woodblock and paper animation'],
['feel-stepped','포즈 투 포즈','픽셀·스톱모션, 코믹 타이밍','Pose to pose','pixel art, stop-motion, comic timing'],
['feel-stroke','한 획씩','화이트보드·서예 드로잉','Stroke by stroke','whiteboard and calligraphy drawing']]);
const GR=[
['g2d','2D 기본','2D basics','style',['kinetic-type','flat-2d','line-art','liquid-morph','rubber-hose','frame-by-frame','particle-abstract','geometric-minimal','swiss-grid','duotone-pop','ui-motion','parallax-2-5d']],
['gil','일러스트·손그림','Illustrated','style',['whiteboard-doodle','paper-collage','watercolor','ink-wash','ukiyo-e','stained-glass','mosaic','storybook','nature-notebook','calligraphy-draw','paper-craft','zine-collage','retro-scrapbook','comic-panels','parchment-map','evidence-board','pop-info','shadow-puppets','visual-novel']],
['g3d','3D','3D','style',['3d-clay','clay-stopmotion','clay-diorama','glass-3d','glass-icons','chrome-metal','3d-type','low-poly','low-poly-atlas','inflatable','jelly-softbody','isometric','iso-cutaway','exploded-view','product-turntable','data-city','size-lineup','cosmic-scale','globe-arcs','physics-toybox','deep-layers','bio-glow','synth-grid']],
['grt','레트로·텍스처','Retro & texture','style',['glitch','retro-vhs','pixel-8bit','neon-cyber','risograph-grain','terminal','doc-cinema','quote-cinema']],
['ggr','그래픽·설명형','Graphic & explainer','style',['infographic','blueprint','isotype','timeline-rail','math-canvas','tactics-board','market-tape']],
['gfm','숏폼 포맷','Short-form formats','format',['quiz-countdown','top5-countdown','tier-list','chat-story','versus-split','myth-or-fact','recipe-steps','breaking-desk','podcast-clip']],
['gov','편집 오버레이','Edit overlays','overlay',['punch-captions','karaoke-subs','callout-kit','lower-thirds','headline-backdrop','stack-split','sticker-pop']],
['gfe','움직임 느낌','Motion feel','feel',['feel-smooth','feel-twos','feel-threes','feel-stepped','feel-stroke']]];
const KIND={};GR.forEach(g=>g[4].forEach(id=>KIND[id]=g[3]));
const T={ko:{tl:'영상에 들어갈 글자를 써 보세요',ph:'오늘의 커피',hl:'"이런 데서 봤죠?" 힌트',seen:'이런 데서 봤죠? ',all:'전체',m:'메인',s:'보조',ok:'선택',f:'포맷',o:'오버레이',e:'움직임',none:'없음',
sub:{style:'카드를 누르면 메인, 하나 더 누르면 보조',format:'영상 틀 · 하나만 (선택)',overlay:'자막·장식 · 여러 개 OK (선택)',feel:'프레임 느낌 · 하나만 (선택)'},
hint0:'스타일 카드를 누르면 <b style="font-weight:500">메인</b>, 하나 더 누르면 <b style="font-weight:500">보조</b>예요. 포맷·오버레이·움직임은 골라도 되고 안 골라도 돼요.',go0:'이 조합으로 진행 ↗',go:(a,b)=>`${a}${b?' + '+b:''}(으)로 진행 ↗`,err:'스타일 카드를 하나 눌러 메인 스타일을 먼저 골라 주세요.'},
en:{tl:'Type the words for your video',ph:'Morning Coffee',hl:'"Seen it in" hints',seen:'Seen in: ',all:'All',m:'Main',s:'Accent',ok:'Picked',f:'Format',o:'Overlays',e:'Feel',none:'none',
sub:{style:'click once for main, another for accent',format:'video template · pick one (optional)',overlay:'captions and extras · pick any (optional)',feel:'frame cadence · pick one (optional)'},
hint0:'Click a style card for the <b style="font-weight:500">main</b> style, another for an <b style="font-weight:500">accent</b>. Format, overlays and feel are optional.',go0:'Continue with this mix ↗',go:(a,b)=>`Continue with ${a}${b?' + '+b:''} ↗`,err:'Pick a main style first by clicking a style card.'}};
const $=id=>document.getElementById(id);let m=null,s=null,fm=null,fe=null,ov=[],tab='all';
G=(document.documentElement.lang||navigator.language||'ko').toLowerCase().startsWith('ko')?'ko':'en';
const row=id=>D.find(x=>x[0]===id);
const nm=id=>{const d=row(id);return G==='ko'?d[1]:d[3]};
const txt=()=>$('txt').value.trim()||T[G].ph;
function card(id,t,h){const X=T[G],d=row(id),k=KIND[id];let cl='',b='';
if(k==='style'){if(id===m){cl=' m';b=`<span class="bd m">${X.m} ✓</span>`}else if(id===s){cl=' s';b=`<span class="bd s">${X.s} ✓</span>`}}
else if((k==='format'&&id===fm)||(k==='feel'&&id===fe)||(k==='overlay'&&ov.includes(id))){cl=' k';b=`<span class="bd k">${X.ok} ✓</span>`}
return `<button class="c${cl}" data-id="${id}">${b}${R[id](t)}<div class="n">${G==='ko'?d[1]:d[3]}${h?`<small>${X.seen}${G==='ko'?d[2]:d[4]}</small>`:''}</div></button>`}
function render(){const t=txt(),h=$('hint').checked,X=T[G];
$('tabs').innerHTML=[['all',X.all,D.length]].concat(GR.map(g=>[g[0],G==='ko'?g[1]:g[2],g[4].length])).map(([k,n,c])=>`<button class="tb${tab===k?' on':''}" data-t="${k}">${n} ${c}</button>`).join('');
$('g').innerHTML=GR.filter(g=>tab==='all'||tab===g[0]).map(g=>`<div class="gh">${G==='ko'?g[1]:g[2]}<small>${X.sub[g[3]]}</small></div><div class="g">${g[4].map(id=>card(id,t,h)).join('')}</div>`).join('');paint()}
function paint(){const X=T[G],p=[];if(m)p.push(`<b style="font-weight:500">${X.m}</b> ${nm(m)}`);if(s)p.push(`<b style="font-weight:500">${X.s}</b> ${nm(s)}`);if(fm)p.push(`<b style="font-weight:500">${X.f}</b> ${nm(fm)}`);if(ov.length)p.push(`<b style="font-weight:500">${X.o}</b> ${ov.map(nm).join(', ')}`);if(fe)p.push(`<b style="font-weight:500">${X.e}</b> ${nm(fe)}`);
$('st').innerHTML=p.length?p.join(' · '):X.hint0;$('go').textContent=m?X.go(nm(m),s?nm(s):''):X.go0}
function lang(l){G=l;const X=T[G];$('tl').textContent=X.tl;$('txt').placeholder=X.ph;$('hl').textContent=X.hl;$('lk').classList.toggle('on',G==='ko');$('le').classList.toggle('on',G==='en');$('e1').textContent='';render()}
$('tabs').addEventListener('click',e=>{const b=e.target.closest('.tb');if(!b)return;tab=b.dataset.t;render()});
$('g').addEventListener('click',e=>{const c=e.target.closest('.c');if(!c)return;const id=c.dataset.id,k=KIND[id];
if(k==='style'){if(id===m){m=s;s=null}else if(id===s){s=null}else if(!m){m=id}else{s=id}}
else if(k==='format'){fm=fm===id?null:id}else if(k==='feel'){fe=fe===id?null:id}
else{ov=ov.includes(id)?ov.filter(x=>x!==id):ov.concat(id)}
$('e1').textContent='';render()});
$('txt').addEventListener('input',()=>{$('e1').textContent='';render()});$('hint').addEventListener('change',render);
$('lk').addEventListener('click',()=>lang('ko'));$('le').addEventListener('click',()=>lang('en'));
$('go').addEventListener('click',()=>{if(!m){$('e1').textContent=T[G].err;return}const t=txt(),ko=G==='ko',X=T[G],q=id=>`${id} (${ko?row(id)[1]:row(id)[3]})`;
sendPrompt(ko?`모션 스타일 선택 → 메인: ${q(m)}, 보조: ${s?q(s):'없음'} · 포맷: ${fm?q(fm):'없음'} · 오버레이: ${ov.length?ov.map(q).join(', '):'없음'} · 움직임: ${fe?q(fe):'기본'} · 글자: "${t}"`:`Motion style picked → main: ${q(m)}, accent: ${s?q(s):'none'} · format: ${fm?q(fm):'none'} · overlays: ${ov.length?ov.map(q).join(', '):'none'} · feel: ${fe?q(fe):'default'} · text: "${t}"`)});
lang(G);
</script>
```
