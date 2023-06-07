# 피팅룸 - 가상 피팅 서비스

## 팀원 소개

|이채운(팀장)|이태윤|김민서|
| :-----------------------------------: | :---------------------------------------: | :-------------------------------------: |
| [dlcodns](https://github.com/dlcodns) | [troymerai](https://github.com/troymerai) | [KIMSSI22](https://github.com/KIMSSI22) |
| 충북대학교 컴퓨터공학과                 | 충북대학교 컴퓨터공학과                     | 충북대학교 컴퓨터공학과                   |
| - | - | minseo03226@gmail.com |


## 서비스 설명

피팅룸은 사용자의 사진과 사용자가 입고싶은 옷 사진 두 장을 받아 자연스럽게 합성해주는 앱 서비스이다.

## 이용 방법

사용자의 상반신 정면이 나온 사진과 입어보고자 하는 의상의 사진을 각각 한 장씩 선택한 후, 이미지를 확정하면 사용자의 상반신에 선택한 의상이 합성되어 반환한 이미지를 받아볼 수 있다.

## 샘플

[동영상 들어갈 곳]

## 아키텍쳐
<img width="866" alt="image" src="https://github.com/dlcodns/OSP_Prediction/assets/107831875/a5853e4d-c1d2-479b-8f44-07e9603389e6">

## 설치 방법
``` bash

``` 

## 의존성 및 설치 환경
api는 코랩 환경에서 구현하였다.
### api server
* 의존성 & 파일 구조<br/>
[api.ipynb](https://github.com/dlcodns/OSP_Prediction/blob/main/api/api.ipynb)에 순서대로 정리했다.<br/><br/>
자세한건 이메일 문의 (16alexandros57@gmail.com)<br/>
### flutter-tryon
[flutter install](https://docs.flutter.dev/get-started/install)
## 사용한 모델
1. [u2net](https://github.com/levindabhi/U-2-Net) (옷 마스크 추출 모델)
2. [self-correction-human-parsing-for-acgpn](https://github.com/levindabhi/Self-Correction-Human-Parsing-for-ACGPN) (사람 몸 분해 모델)
3. [ACGPN](https://github.com/switchablenorms/DeepFashion_Try_On) (옷 합성 모델)

## 라이센스
본 프로젝트는 기본적으로 GNU GPL 2.0을 따르고 있다.

- 소스 코드를 용도에 따라 변경 가능하나 배포하는 경우, 수정한 부분에 대한 소스 코드 변경사항을 반영하여 전체 소스 코드를 제공해야한다.
- 복제본에는 원본 저작권의 표시와 보증에 책임이 없음을 명시한다.
- 모든 파생물 또한 라이센스로 GPL 2.0을 따른다.

자세한 내용은 LICENSE 문서를 참고하고, 문의 사항은 본 프로젝트의 책임자(-)에게 연락할 수 있다.





