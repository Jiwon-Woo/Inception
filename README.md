# page 0


- Inception
- 인셉션

- Summary: This document is a System Administration related exercise.
- 요약: 이 문서는 시스템 관리 관련 실습입니다.


# page 1


| 챕터 | 내용 | 페이지 |
|:---:|:---|:---:|
| I | [__전문__]() | 2 |
| II | [__소개__]() | 3 |
| III | [__기본 지시사항__]() |  4 |
| IV | [__필수 파트__]() |  5 |
| V | [__보너스 파트__]() |  9 |
| VI | [__제출 및 동료평가__]() |  10 |


# page 2

 
Chapter I
챕터 1

Preamble
전문

- ONE CONTAINER IS NOT ENOUGH
- 하나의 컨테이너로는 충분하지 않습니다
- WE NEED TO GO DEEPTER
- 우리는 더 깊이 가야 합니다


# page 3


Chapter II
챕터 2

Introduction
소개

- This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.
- 이 프로젝트는 도커를 사용해서 시스템 관리에 대한 지식을 넓히는 것이 목표입니다. 새로운 가상 머신에서 여러 도커 이미지를 만들 것입니다.


# page 4


Chapter III
챕터 3

General guidelines
기본 지시사항

- This project need to be done on a Virtual Machine.
- 이 프로젝트는 가상머신에서 실행되어야 합니다.

- All the files required for the configuration of your project must be placed in a **srcs** folder.
- 프로젝트 구성에 필요한 모든 파일은 반드시 **srcs** 폴더 안에 저장해야 합니다.

- A **Makefile** is also required and must be located at the root of your directory. It must set up your entire application (i.e., it has to build the Docker images using docker-compose.yml).
- **Makefile** 은 반드시 루트 디렉토리에 있어야 합니다. Makefile은 반드시 모든 애플리케이션(즉, docker-compose.yml을 사용해서 도커 이미지를 빌드해야 합니다)을 설정해야 합니다.

- This subject requires putting into practice concepts that, depending on your back-ground, you may not have learned yet. Therefore, we advise you not to hesitate to read a lot of documentation related to Docker usage, as well as anything else you will find helpful in order to complete this assignment.
- 이 과제는 여러분의 배경지식에 따라 아직 배우지 않은 개념을 연습해야 합니다. 이 과제를 완료하기 위해, 도커 사용과 관련된 많은 문서를 읽는 것을 주저하지 않길 권합니다.


# page 5


Chapter IV
챕터 4

Mandatory part
필수 파트

- This project consists in having you set up a small infrastructure composed of different services under specific rules. The whole project has to be done in a virtual machine. You have to use docker-compose.
- 이 프로젝트는 특정 규칙에 따라 서로 다른 서비스로 구성된 소규모 인프라를 구축하는 것입니다. 모든 프로젝트는 가상 머신에서 수행되어야 합니다. 여러분은 docker-compose를 사용해야 합니다.

- Each Docker image must have the same name as its corresponding service.
- 각 도커 이미지는 반드시 해당 서비스와 같은 이름이어야 합니다.

- Each service has to run in a dedicated container.
- 각 서비스는 전용 컨테이너에서 실행되어야 합니다.

- For performance matters, the containers must be built either from the penultimate stable version of Alpine Linux, or from Debian Buster. The choice is yours.
- 성능상의 문제를 위해, 컨테이너는 반드시 Alpine Linux의 안정적인 버전(최신 버전의 이전 버전)을 쓰거나 Debian Buster에서 만들어져야 합니다. 선택은 여러분 몫입니다.

- You also have to write your own **Dockerfiles**, one per service. The **Dockerfiles** must be called in your **docker-compose.yml** by your **Makefile**.
- 한 서비스당 **Dockerfile**을 하나씩 작성해야 합니다. 반드시 **Makefile**로 **docker-compose.yml**을 호출해야 합니다.

- It means you have to build yourself the Docker images of your project. It is then for-bidden to pull ready-made Docker images, as well as using services such as DockerHub (Alpine/Debian being excluded from this rule).
- 프로젝트의 도커 이미지를 직접 만들어야 한다는 의미입니다. 이미 만들어진 도커 이미지는 물론 Dockerhub 같은 서비스를 사용하는 것은 금지됩니다. (Alpine/Debian은 이 규칙에서 제외됩니다)

- You then have to set up:
- 아래와 같이 설정해야 합니다:

  - A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
  - TLSv1.2 또는 TLSv1.3 만 있는 NGINX를 포함하는 도커 컨테이너.

  - A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
  - nginx 없이 WordPress + php-fpm(반드시 설치되고 구성되어야 합니다)만 설치된 도커 컨테이너.

  - A Docker container that contains MariaDB only without nginx.
  - nginx 없이 MariaDB만 설치된 도커 컨테이너.

  - A volume that contains your WordPress database.
  - WordPress 데이터 베이스가 포함된 볼륨.

  - A second volume that contains your WordPress website files.
  - WordPress 웹사이트 파일이 포함된 두번쩨 볼륨.

  - A docker-network that establishes the connection between your containers. 
  - 컨테이너들 사이의 연결을 설계하는 도커 네트워크.

- Your containers have to restart in case of a crash.
- 컨테이너는 충돌이 발생한 경우에 다시 시작해야합니다.

- A Docker container is not a virtual machine. Thus, it is not recommended to use any hacky patch based on ’tail -f’ and so forth when trying to run it. Read about how daemons work and whether it’s a good idea to use them or not.
-  도커 컨테이너는 가상머신이 아닙니다. 더불어, 실행할 때 "tail -f"을 기반한 어떠한 해키 패치(임시 방편의 부분)를 사용하는 것은 권장하지 않습니다. 데몬의 동작 방식과 데몬을 사용하는 것이 좋은지에 대해 읽어보세요.


# page 6


-  Of course, using network: host or --link or links: is forbidden. The network line must be present in your docker-compose.yml file. Your containers musn’t be started with a command running an infinite loop. Thus, this also applies to any command used as entrypoint, or used in entrypoint scripts. The following are a few prohibited hacky patches: tail -f, bash, sleep infinity, while true.
- 마찬가지로 네트워크를 사용하는 것: host 또는 --link 또는 links: 는 금지되어 있습니다. 네트워크 선언은 반드시 docker-compose.yaml 파일에 이루어져야 합니다. 컨테이너는 무한 루프로 돌아가는 명령어로 시작하면 절대로 안됩니다. 또한 entryporint 또는 entrypoint.sh에서 실행되는 명령어도 이 규칙을 따라야 합니다. 다음은 금지된 해키 패치들 입니다: tail -f, bash, sleep infinity, while true.

- Read about PID 1 and the best practices for writing Dockerfiles.
- PID 1에 대해 읽고 도커 파일 작성을 위한 최적의 연습을 해보세요

- In your WordPress database, there must be two users, one of them being the administrator. The administrator’s username can’t contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth).
- 워드프레스 데이터 베이스에는 반드시 2명의 유저가 있어야 하는데, 그 중 한 명은 관리자입니다. 관리자의 이름은 admin/Admin 또는 administrator/Administrator (예시., admin, administrator, Administrator, admin-123 기타 등등)이 포함되어서는 안됩니다.

- Your volumes will be available in the /home/login/data folder of the host machine using Docker. Of course, you have to replace the login with yours.
- 볼륨은 도커를 사용하여 host 머신의 /home/login/data 폴더에 존재해야 합니다. 마찬가지로, 이 때 login은 로그인이 아닌 여러분의 인트라 아이디여야 합니다.

- To make things simpler, you have to configure your domain name so it points to your local IP address.
This domain name must be login.42.fr. Again, you have to use your own login.
For example, if your login is wil, wil.42.fr will redirect to the IP address pointing to wil’s website.
- 간단하게 하기 위해서, 로컬 IP 주소를 가리키도록 도메인 이름을 구성해야 합니다. 도메인 이름은 반드시 login.42.fr 이어야 합니다. 다시 말해, 여러분이 만든 login을 사용해야 합니다.

- The latest tag is prohibited.
No password must be present in your Dockerfiles.
It is mandatory to use environment variables.
Also, it is strongly recommended to use a .env file to store environment variables. The .env file should be located at the root of the srcs directory.
Your NGINX container must be the only entrypoint into your infrastructure via the port 443 only, using the TLSv1.2 or TLSv1.3 protocol.
- latest 태그는 금지되어있습니다.
어떠한 비밀번호도 도커파일에서 보여지면 안됩니다.
환경 변수를 사용하는 것이 필수입니다.
또한, 환경변수를 저장할 .env 파일을 사용하는 것을 강력하게 권합니다. .env 파일은 srcs 루트 디렉토리에 위치해있어야 합니다.
NGINX 컨테이너는 반드시 TLSv1.2 또는 TLSv1.3 프로토콜을 사용하여 오직 443 포트만을 통해서 접속을 허용해야 합니다.


# page 7


- Here is an example diagram of the expected result:
- 예상 결과의 다이어그램 예시입니다.


# page 8


- Below is an example of the expected directory structure:
- 아래는 예상 폴더 구조의 예시입니다.


# page 9


Chapter V
챕터 5

Bonus part
보너스 파트

- For this project, the bonus part is aimed to be simple.
- 이 프로젝트에서, 보너스 파트는 단순화를 목표로 합니다

- A Dockerfile must be written for each extra service. Thus, each one of them will run inside its own container and will have, if necessary, its dedicated volume.
- 각 서비스에 대해 도커파일을 작성해야 합니다. 더불어 각 서비스는 자체 컨테이너 내부에서 실행되며, 필요하다면, 전용 볼륨을 가집니다.

- Bonus list:
- 보너스 목록:

  - Set up **redis cache** for your WordPress website in order to properly manage the cache.
  - 캐시를 적절히 관리하기 위해 여러분의 워드프레스 사이트에 redis 캐시를 설정하세요.

  - Set up a **FTP server** container pointing to the volume of your WordPress website.
  - 워드프레스 웹사이트의 볼륨에 접근할 수 있는 FTP 서버 컨테이너를 설정하세요.

  - Create a simple static website in the language of your choice except PHP (Yes, PHP is excluded!). For example, a showcase site or a site for presenting your resume.
  - PHP를 제외하고 여러분이 선택한 언어로 간단한 정적 웹사이트를 만들어보세요.(네, PHP는 제외입니다!). 예를 들어, 쇼케이스 사이트나 여러분의 이력서를 보여줄 만한 사이트요.

  - Set up **Adminer**.
  - Adminer를 설정하세요.

  - Set up a service of your choice that you think is useful. During the defense, you will have to justify your choice.
  - 이 외에 유용하다고 생각하는 서비스를 설정하세요. 디펜스 동안, 여러분은 여러분의 선택을 증명해야 합니다.

- To complete the bonus part, you have the possibility to set up extra services. In this case, you may open more ports to suit your needs.
- 보너스파트를 완성하면, 여분의 서비스를 설정할 수 있습니다. 이 경우, 필요에 따라 더 많은 포트를 열을 수 있습니다.

- The bonus part will only be assessed if the mandatory part is PERFECT. Perfect means the mandatory part has been integrally done and works without malfunctioning. If you have not passed ALL the mandatory requirements, your bonus part will not be evaluated at all.
- 보너스 파트는 필수 파트가 완벽할 때 접근할 수 있습니다. 완벽함이란 필수 파트가 오작동없이 완전히 수행되고 동작함을 의미합니다. 만약 모든 필수 파트를 통과하지 못했다면, 보너스 파트는 평가받을 수 없습니다.


# page 10


Chapter VI
챕터 6

Submission and peer-evaluation
제출 및 동료 평가

- Turn in your assignment in your Git repository as usual. Only the work inside your repository will be evaluated during the defense. Don’t hesitate to double check the names of your folders and files to ensure they are correct.
- 평소처럼 GIT 저장소에 과제를 제출합니다. 오직 저장소 안에 있는 과제만이 디펜스 동안 평가받을 것입니다. 맞는지 확신하기 위해 폴더와 파일 이름을 더블 체크하는 것을 두려워하지 마세요.
