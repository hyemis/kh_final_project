# 파이널 프로젝트 : JOB-A 구인구직 사이트:handshake:

## Contents:card_index_dividers:
1. [팀 소개](#1️⃣-팀-소개)
2. [프로젝트 개요](#2️⃣-프로젝트-개요)
3. [설계의 주안점](#3️⃣-설계의-주안점)
4. [사용기술 및 개발환경](#4️⃣-사용기술-및-개발환경)
5. [주요기능](#5️⃣-주요기능)
6. [Document](#6️⃣-Document)
7. [최종발표자료](#7️⃣-최종발표자료)
 
 
 ## 1️⃣ 팀 소개
 ![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/c67f1ea7-a030-4090-af63-34945472c151)
 <br>
 <br>
 ## 2️⃣ 프로젝트 개요
 <img width="80%" src="https://github.com/NukNim/kh_final_project/assets/114970601/267ea93d-cbbe-48e8-b16a-a6a088c07ee8"/>
 
 ## 3️⃣ 설계의 주안점  
 ✔️ 원활한 관리를 위해 **카테고리를 지정**하여 관리자 페이지에서 변경 내용을 **일괄적으로 관리 가능**  
   
 ✔️ 개인 회원의 이력서 내 학력, 자격증, 경력 정보에 **독립적인 관리 프로세스를 제공**하여 각각의 이력서마다 원하는 개인 정보 입력 가능  
   
 ✔️ 기업에서 직접 작성 가능한 기업 소개 페이지가 있어 해당 기업에 관한 **다양한 정보 제공** 이 가능  
   
 ✔️ 기업이 채용 과정 단계별로 관리 및 알림을 보낼 수 있으며, 사이트 내에서 일괄적으로 **구인 프로세스 관리 가능**
   
   
 <br>    
       
 ## 4️⃣ 사용기술 및 개발환경
 
<div align="center">    
<img width="90%" alt="image" src="https://github.com/NukNim/kh_final_project/assets/114903799/e290e435-a11d-4fb5-8556-4906babfcb9b"> 
</div>


## 5️⃣ 주요기능
<div align="center">
<img width="230" alt="image" src="https://github.com/NukNim/kh_final_project/assets/114970601/10918d26-170c-42b3-8037-89b7ca2997c3">
</div>

<details>
<summary><h3>✅ 관리자 카테고리 관리 </h3></summary>
<div markdown="1"> 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 화면 예시 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
 <div align="center">
  <img width="" alt="image" src="https://github.com/NukNim/kh_final_project/assets/114903799/f0349833-dbfd-42e3-80fb-9a289b85f069">
 </div>
 
 </div>
 </details>
 
 <details>
<summary><h3>✅ 기업 채용공고 </h3></summary>
<div markdown="1"> 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 화면 예시 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
 <br>
 
 <div align="center">
  <img width="90%" alt="image" src="https://github.com/NukNim/kh_final_project/assets/114903799/c02f2a19-8282-4c99-a92b-6c430793f2df"> 
 </div>
 
 </div>
 </details>
 
 <details>
<summary><h3>✅ 지원자 관리 </h3></summary>
<div markdown="1"> 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 화면 예시 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
 <br>
 
 <div align="center">
  <img width="100%" alt="image" src="https://github.com/NukNim/kh_final_project/assets/114903799/6e579389-a08e-4377-9ded-6606a3ffa4f6">
 </div>
 
 </div>
 </details>
 
<div align="center">
<img width="230" alt="image" src="https://github.com/NukNim/kh_final_project/assets/114970601/3838da3c-9341-4328-be92-11a688e5a03b">
</div>

<details>
<summary><h3>✅ OPEN API 연동 샘플데이터 추가 </h3></summary>
<div markdown="1"> 
 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">워크넷 API로 채용공고 샘플데이터 추가<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
 </div>
 
 <br>
 
 <div align="center">
<img width="80%" src="https://github.com/NukNim/kh_final_project/assets/114970601/37353267-2b13-420e-998a-137f0e51f072">
 </div>
  
  - 워크넷 채용공고 API사용.
  - OpenApiUtils 생성 후 제너릭 사용해 dto에 저장.
 <br>
 
 <div align="center">
 <img width="65%" src="https://github.com/NukNim/kh_final_project/assets/114970601/01707431-33b1-4734-a429-1ac7b34e1bcd">
   </div>
 
  - API에서 지원하지 않는 출력값의 경우, NodeList 객체를 생성해 추출한 텍스트 콘텐츠를 리턴하도록 하였고 요소를 찾지 못한 경우에는 NULL을 리턴하도록 함.
 <br>
 
  <div align="center">
  <img width="70%" src="https://github.com/NukNim/kh_final_project/assets/114970601/b81afc2c-1fe8-4b22-a062-0ca258c6fb27">
 </div>
 
 - 데이터가 XML형태로 들어와 XML파싱메소드를 이용해 데이터를 파싱.
 <br>

 </details>

 <details>
<summary><h3>✅ 이력서 작성 및 입사지원 </h3></summary>
<div markdown="1"> 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 소제목입력 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
 <br>
 
 <div align="center">
  내용입력
 </div>
 
 </div>
 </details>
 
 <details>
<summary><h3>✅ 공고 & 기업 스크랩 </h3></summary>
<div markdown="1"> 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 소제목입력 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
 <br>
 
 <div align="center">
  내용입력
 </div>
 
 </div>
 </details>
 
 <div align="center">
<img width="200" alt="image" src="https://github.com/NukNim/kh_final_project/assets/114970601/d5926a64-3877-4fd8-8a3f-3ee649ac046e">
</div>

<details>
<summary><h3>✅ 인재찾기 및 면접제안 </h3></summary>
<div markdown="1"> 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 소제목입력 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
 <br>
 
 <div align="center">
  내용입력
 </div>
 
 </div>
 </details>
 
 <details>
<summary><h3>✅ 기업 게시글 작성 </h3></summary>
<div markdown="1"> 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 소제목입력 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
 <br>
 
 <div align="center">
  내용입력
 </div>
 
 </div>
 </details>
 
 <details>
<summary><h3>✅ 면접일정 보기 </h3></summary>
<div markdown="1"> 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 소제목입력 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
 <br>
 
 <div align="center">
  내용입력
 </div>
 
 </div>
 </details>
 
  <div align="center">
<img width="200" alt="image" src="https://github.com/NukNim/kh_final_project/assets/114970601/8312f9fe-aaa5-4d1d-9946-257ea2eed474">
</div>

<details>
<summary><h3>✅ 회원가입 및 로그인 </h3></summary>
<div markdown="1"> 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 회원가입 및 로그인 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
 <br>
 
<div align="center">
<img src="https://github.com/NukNim/kh_final_project/assets/114970462/4c32d584-a5b1-43c7-a865-65beb5b52285">
<img src="https://github.com/NukNim/kh_final_project/assets/114970462/d601bf4b-82d6-4245-8cfe-b8333f8aed14">
</div>
 
 <br>
 <br>
 <br>
 
 <div align="center">
 <img src="https://github.com/NukNim/kh_final_project/assets/114970462/0a804c77-d9e0-4a2c-86ee-15c317b73192">
  회원가입 
 </div>
 
<br> 
<br> 
<br>
 
  1. 개인회원, 기업회원 선택 후 회원 가입 
  2. 모든 회원 정보 기입 필수 
  3. 아이디 정규 표현식 체크 , 아이디 중복 체크
  4. 비밀번호 정규 표현식 체크, 비밀번호 / 비밀번호 확인 불일치 체크, 아이디 / 비밀번호 불일치 체크 
  5. 이름, 이메일 정규 표현식 체크 
  7. 회원가입 버튼 클릭 시 아이디, 이메일 중복된 데이터 여부 한번 더 체크 후 회원가입 

 ---
 
<br> 
<br> 
<br>
 
<div align="center">
 <img src="https://github.com/NukNim/kh_final_project/assets/114970462/040fd29f-2edc-495d-80de-70e742e80b14">
</div>
 
<br> 
<br> 
<br>
 
<div align="center">
 <img src="https://github.com/NukNim/kh_final_project/assets/114970462/6262f694-9033-4653-a11e-16f02f979a88">
  카카오 로그인 
 </div>
 
<br> 
<br> 
<br>
 
1. 카카오 인증 서버와의 통신을 통해 액세스 토큰 가져오기 
2. 토큰을 사용하여 카카오톡 API 서버에 사용자 정보를 요청
3. 사용자 정보와 데이터베이스 데이터 비교해 일치 시 권한 생성 후 로그인 , 불일치 시 로그인 화면 출력

---
 
<br> 
<br> 
<br>
 
 
 </div>
 </details>
 
 <details>
<summary><h3>✅ 이력서 생성 </h3></summary>
<div markdown="1"> 
<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 이력서 생성 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
 <br>
 
<div align="center">
<img src="https://github.com/NukNim/kh_final_project/assets/114970462/f05ca6ed-c33a-4bdd-995e-151ffa940a22">
</div>
 
<br> 
<br> 
<br>
 
 <div align="center">
 <img src="https://github.com/NukNim/kh_final_project/assets/114970462/64726f50-1f0f-4c52-8a4d-4c1d3cd2c660">
  이력서 생성
 </div>
 
<br> 
<br> 
<br>
 
1. 현재 로그인한 회원 정보를 포함한 이력서 작성 페이지 출력  
2. 이력서 사진 존재 시 Google Cloud Storage에 파일 업로드 후 이력서 작성 페이지에 재출력
3. 이력서 제목 글자 수 제한, 필수 입력 / 입력 사항 선택 
4. 포트폴리오 파일 존재 시 Google Cloud Storage 파일 업로드 
5. 다음 버튼 클릭 시 이력서 생성 

 ---
 
<br> 
<br> 
<br>
 
 
<div align="center">
<img src="https://github.com/NukNim/kh_final_project/assets/114970462/1dcbb31e-5eb7-41fa-bb7e-51c04b4a1f9f">
<img src="https://github.com/NukNim/kh_final_project/assets/114970462/6475d74c-253d-4cd0-ace0-66aab61cf7ec">
</div>
 
<br> 
<br> 
<br>
 
<div align="center">
<img src="https://github.com/NukNim/kh_final_project/assets/114970462/558335bd-24a8-4182-8a1d-e0226eea40ec">
  자격증 입력
 </div>
 
<br> 
<br> 
<br>
 
1. 현재 이력서에 새 자격증 정보 입력 
2. 새정보추가 버튼 클릭 후 추가된 입력 form 에 현재 이력서에 여러 개의 새 자격증 정보 입력 
2. 저장된 정보 불러오기로 기존 자격증 선택한 순서대로 출력
3. 기존 자격증 정보로 현재 이력서에 자격증 정보 추가 / 수정 / 삭제


---
 
<br> 
<br> 
<br>
 
 </div>
 </details>
 
 <details>
<summary><h3>✅ 채용정보검색 </h3></summary>
<div markdown="1"> 
 <div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">  채용정보검색 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>
 
<br>
 
<div align="center">
<img src="https://github.com/NukNim/kh_final_project/assets/114970462/57b60a24-85ba-4117-bfa9-518ddf31c092">
<img src="https://github.com/NukNim/kh_final_project/assets/114970462/5bdf1c70-bbfa-4dc3-84a1-7ad93d0fde39">
</div>

 <br>
 <br>
 <br>
 
 <div align="center">
 <img src="https://github.com/NukNim/kh_final_project/assets/114970462/ec21ef55-811f-49be-8481-9a5cdb597c66">
  채용 정보 검색
 </div>
 
<br> 
<br> 
<br>
 
1. 지역, 직종, 우대조건 카테고리 / 현재 채용 중인 채용 공고를 포함한 채용 정보 조회 페이지 출력
2. 3단계 카테고리 선택 시 해당되는 채용 공고 출력 
3. 체크박스로 선택된 조건으로 채용 공고 검색 
4. 검색어로 채용 공고 검색
5. 채용 공고 제목, 채용 회사 클릭 시 새 창으로 채용 공고 상세 페이지 출력 
6. 별 아이콘 클릭 시 해당 채용 공고 스크랩, 다시 클릭 시 스크랩 취소

 ---
 
<br> 
<br> 
<br>
 
 </div>
 </details>
 
## 6️⃣ Document
## 1. 개발일정
<img width="80%" src="https://github.com/NukNim/kh_final_project/assets/114970601/48072776-640d-4bbe-b968-3fb409f5bee3"/>  

<br>

## 2. 요구사항정의서
[요구사항정의서 전체보기](https://docs.google.com/spreadsheets/d/1ZSz9kat6E9u9owKFZAw9wt1C078Hlw0f/edit#gid=15147080)

<br>

## 3. 화면설계서
[화면설계서 전체보기](https://drive.google.com/file/d/1a4bbvSW0Fl5gLfnMDt6l8ZmQv32qvjZr/view?usp=sharing)

<br>

## 4. ERD
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/dcc0cb4b-eece-4512-88e4-3d858485cc8e)

<br>

## 5. 시퀀스 다이어그램  
<h3 align="center">지원자관리</h3>
<p align="center"><img src="https://github.com/NukNim/kh_final_project/assets/114970601/d3fe9518-35a7-42ee-9132-e5266515cca0"></p>
<br>
<h3 align="center">일반로그인</h3>
<p align="center"><img src="https://github.com/NukNim/kh_final_project/assets/114970601/87a99bed-da59-43c4-aade-e638e91acf16"></p>
<h3 align="center">카카오 로그인</h3>
<p align="center"><img src="https://github.com/NukNim/kh_final_project/assets/114970601/05052ca8-b322-4797-b1f3-5cf179b8dcb6"></p>
<br>
<h3 align="center">채용공고 등록</h3>
<p align="center"><img src="https://github.com/NukNim/kh_final_project/assets/114970601/f6200201-545b-4a06-9e93-6a28f8e2c70f"></p>
<br>
<h3 align="center">이력서 등록</h3>
<p align="center"><img src="https://github.com/NukNim/kh_final_project/assets/114970601/96afdc5c-4ca4-42e8-aeae-1a32d1f86d75"></p>
<br>

## 6. 클래스 다이어그램
<details>
<summary><h3>Person</h3></summary>
<div markdown="1"> 

![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/94512b83-c63f-4679-b2cf-bb4c9b581046)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/bcb50e31-41ad-40b0-9a84-f1f6410ad401)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/f1722e67-4caa-47ed-89d6-af16c3f7c75a)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/c3bde1ad-24f1-4e00-97f4-a227efe22962)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/4af94fe8-6530-4373-9bd3-4dbe150d6316)

</div>
</details>
 
<details>
<summary><h3>Resume</h3></summary>
<div markdown="1"> 

![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/691de68f-a4c5-4cd5-94de-f7ee52afeb08)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/f5627b6a-e627-41f1-9900-f03e965b33bd)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/daa36dc2-aa5f-4c9f-8ca0-b88d4b957e08)

</div>
</details>

<details>
<summary><h3>Business</h3></summary>
<div markdown="1"> 

![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/9c14f79c-24db-4653-9f32-9cc16e957490)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/9ece5003-bfe3-47dd-ae53-9a2c3db8ea2d)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/a8e6b6e6-28ca-4230-8922-7fc990e6819f)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/390b0d6d-5ffc-432d-abfd-2468a11a64b8)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/31a39cba-fef5-4d50-a644-552e4f1c0b1e)

</div>
</details>

<details>
<summary><h3>Admin</h3></summary>
<div markdown="1"> 

![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/4303aa2d-5597-4a8d-b4b2-302686bd61c7)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/7a0c8f2d-6256-4535-94e3-28fbfd890455)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/8c893b60-11c0-4114-947d-37d14c54590d)
![이미지](https://github.com/NukNim/kh_final_project/assets/114970601/9f9d59de-ad39-4b30-ac57-8b71e0fcb67b)

</div>
</details>
<br>

## 7. History
[History 전체보기](https://docs.google.com/spreadsheets/d/1cB94RR9iWxg4tUijVIwjBgCle971YG0dyTfw_vWl-iQ/edit#gid=0)
<br>

## 8. 테스트 케이스
[테스트케이스 전체보기](https://docs.google.com/spreadsheets/d/1TQ_Q0W1wnNszXugbbQc8--QzBXlqzesy/edit#gid=1257668180)
<br>

## 7️⃣ 최종발표자료
