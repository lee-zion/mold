# 작업 디렉토리 생성방법

```
./qq 문제번호 프로그래밍언어
./qq 문제링크 프로그래밍언어
./sqq 문제번호 프로그래밍언어
./sqq 문제링크 프로그래밍언어
```

## sqq

- 디렉토리 이름이 문제명이 아니라 SHA1 값으로 바뀜

# 설치

```
python3 -m venv venv
source venv/bin/activate
python3 -m pip install -r requirements.txt
```

## 예시

```
./qq 0000
./qq https://www.acmicpc.net/problem/1000

./qq 1000 py
./qq 1000 cpp
./qq 1000 java

./sqq 1000
./sqq https://www.acmicpc.net/problem/1000
```

# 기본 프로그래밍언어 수정 방법

- 기본 프로그래밍언어는 `python`으로 되어있음
- `qq` 파일 수정으로 변경 가능
  - [qq:L10의 tester](/qq#L10)
  - [qq:L19의 cp](/qq#L19)

## 예시 (cpp)

```qq
tester="test.cpp"
cp .cpp/* "${array[0]}";;
```

# 샘플 수정 방법

- `.sample` 디렉토리 내 파일 수정

# Troubleshoot

## `urllib.error.HTTPError: HTTP Error 403: Forbidden`

- .qq/get_title의 User-Agent를 최신으로 변경