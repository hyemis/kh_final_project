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
 
 ## 2️⃣ 프로젝트 개요
 <img width="80%" src="https://github.com/NukNim/kh_final_project/assets/114970601/267ea93d-cbbe-48e8-b16a-a6a088c07ee8"/>
 
 ## 3️⃣ 설계의 주안점  
 ✔️ 원활한 관리를 위해 **카테고리를 지정**하여 관리자 페이지에서 변경 내용을 **일괄적으로 관리 가능**  
   
 ✔️ 개인 회원의 이력서 내 학력, 자격증, 경력 정보에 **독립적인 관리 프로세스를 제공**하여 각각의 이력서마다 원하는 개인 정보 입력 가능  
   
 ✔️ 기업에서 직접 작성 가능한 기업 소개 페이지가 있어 해당 기업에 관한 **다양한 정보 제공** 이 가능  
   
 ✔️ 기업이 채용 과정 단계별로 관리 및 알림을 보낼 수 있으며, 사이트 내에서 일괄적으로 **구인 프로세스 관리 가능**
   
   
 <br>    
       
 ## 4️⃣ 사용기술 및 개발환경
 
    IDE       :  Eclipse 2020-03 (4.15.0), Spring Tool Suite 3 version : 3.9.12.RELEASE
    DBMS      :  Oracle 11XE DB - sqldeveloper 17.2.0
    Server    :  Apache Tomcat 9.0
    Language  : java 11, HTML5, CSS, javascript, jQuery 3.4.1 ,Servlet, bootstrap5 v5.0.0(js v5.0.2)
    FrameWork : Spring framework : v5.3.24, lombok v1.18.26, mybatis v3.5.6,                           
                Spring security v5.7.5, google clude v2.6.1, javax.mail v1.6.2
    API       : 워크넷 채용정보 API ( http://openapi.work.go.kr/opi/opi/opia/wantedApi.do),
                카카오 Map API, 다음 우편번호  API, Ckeditor      
                
    version manage system : github desktop 3.2.0


## 5️⃣ 주요기능

## 6️⃣ Document
## 1. 개발일정
<img width="80%" src="https://github.com/NukNim/kh_final_project/assets/114970601/48072776-640d-4bbe-b968-3fb409f5bee3"/>  

<br>

## 2. 요구사항정의서
[요구사항정의서 전체보기](https://docs.google.com/spreadsheets/d/1ZwQjNBa_yiU-vb-vz2i-fItNsED2IWbJ/edit#gid=15147080)

<br>

## 3. 화면설계서
[화면설계서 전체보기]()

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

## 7. History
[History 전체보기](https://docs.google.com/spreadsheets/d/1hU5bQROG7wYa3qBxsS_AOgnL1GLnBWjACK8rh-FXaBw/edit#gid=0)
<br>

## 8. 테스트 케이스
<br>

## 7️⃣ 최종발표자료
