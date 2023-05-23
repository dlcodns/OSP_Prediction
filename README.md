# 가상 피팅 서비스

### 서비스 설명

가상 피팅 서비스는 사용자의 사진과 사용자가 입고싶은 옷 사진 두 장을 받아 자연스럽게 합성해주는 서비스이다.

## 샘플

[동영상 들어갈 곳]



## 의존성 및 설치 환경

api는 코랩 환경에서 구현하였음

### api server
* 의존성 & 파일 구조<br/>
[api.ipynb](https://github.com/dlcodns/OSP_Prediction/blob/main/api/api.ipynb)에 순서대로 정리해둠<br/><br/>
자세한건 이메일 문의 (16alexandros57@gmail.com)<br/>

### flutter-tryon

[flutter install](https://docs.flutter.dev/get-started/install)

## 사용한 모델
1. [u2net](https://github.com/levindabhi/U-2-Net) (옷 마스크 추출 모델)
2. [self-correction-human-parsing-for-acgpn](https://github.com/levindabhi/Self-Correction-Human-Parsing-for-ACGPN) (사람 몸 분해 모델)
3. [ACGPN](https://github.com/switchablenorms/DeepFashion_Try_On) (옷 합성 모델)





