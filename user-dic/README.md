# 사용자 사전 추가 (Mecab-Ko-MSVC)

## 준비
[mecab-ko-msvc](https://github.com/Pusnow/mecab-ko-msvco)와 [mecab-ko-dic-msvc](https://github.com/Pusnow/mecab-ko-dic-msvc) 을 다운받아 설치합니다. 
반드시 `C:\mecab` 경로에 설치하셔야 사전 추가가 가능합니다.

## 사전 추가
`C:\mecab\user-dic` 디렉토리 안에 csv 확장자로 사전 파일을 추가합니다.


    user-dic/
    ├── nnp.csv
    ├── person.csv
    └── place.csv

* 일반적인 고유명사 추가
    
        대우,,,,NNP,*,F,대우,*,*,*,*
        구글,,,,NNP,*,T,구글,*,*,*,*

* 인명 추가

        까비,,,,NNP,인명,F,까비,*,*,*,*

* 지명 추가

        세종,,,,NNP,지명,T,세종,*,*,*,*
        세종시,,,,NNP,지명,F,세종시,Compound,*,*,세종/NNP/지명+시/NNG/*

그 외의 품사 추가가 필요한 경우에는 [품사태그표](https://docs.google.com/spreadsheet/ccc?key=0ApcJghR6UMXxdEdURGY2YzIwb3dSZ290RFpSaUkzZ0E&usp=sharing#gid=4) 를 참고하세요.

## 사전 컴파일

Powershell을 이용하여 작업하셔야 합니다. 단축키 `(윈도우키) + R` 을 누르고 `powershell` 을 입력하면 실행 가능합니다.

* `C:\mecab` 경로로 이동합니다.

        PS C:\Users> cd C:\mecab
        PS C:\mecab>
* `tools\add-userdic-win.ps1` 스크립트를 실행합니다.

        PS C:\mecab> tools\add-userdic-win.ps1
        generating userdic...
        C:\mecab\mecab-ko-dic\model.def is not a binary model. reopen it as text mode...
        reading C:\mecab\user-dic\nnp.csv ...
        done!
        ...생략

    
아래와 같이 user-xxx.csv 사전이 추가된 모습을 볼 수 있습니다. 사실 아래 파일은 컴파일 되기 직전의 파일이며, 실제로 sys.dic 파일에 바이너리로 컴파일 되어 들어가게 됩니다.

    mecab-ko-dic
    ├── ....
    ├── user-nnp.csv
    ├── user-person.csv
    ├── user-place.csv
    └── ...

## 설치
설치 과정은 따로 필요 없습니다. 바로 사용하시면 됩니다.


# 사용자 사전 추가 (Original)

## 준비
[mecab-ko](https://bitbucket.org/eunjeon/mecab-ko)와 [mecab-ko-dic](https://bitbucket.org/eunjeon/mecab-ko-dic) 을 다운받아 설치합니다. mecab-ko-dic 을 꼭 컴파일까지 하셔야 이후에 사전 추가가 가능합니다.

## 사전 추가
내려받은 mecab-ko-dic/userdic 디렉토리 안에 csv 확장자로 사전 파일을 추가합니다.

    :::text
    userdic/
    ├── nnp.csv
    ├── person.csv
    └── place.csv


  * 일반적인 고유명사 추가
    
        :::text
        대우,,,,NNP,*,F,대우,*,*,*,*
        구글,,,,NNP,*,T,구글,*,*,*,*

  * 인명 추가

        :::text
        까비,,,,NNP,인명,F,까비,*,*,*,*
    
  * 지명 추가

        :::text
        세종,,,,NNP,지명,T,세종,*,*,*,*
        세종시,,,,NNP,지명,F,세종시,Compound,*,*,세종/NNP/지명+시/NNG/*

그 외의 품사 추가가 필요한 경우에는 [품사태그표](https://docs.google.com/spreadsheet/ccc?key=0ApcJghR6UMXxdEdURGY2YzIwb3dSZ290RFpSaUkzZ0E&usp=sharing#gid=4) 를 참고하세요.

 
## 사전 컴파일
    :::text
    $ mecab-ko-dic/tools/add-userdic.sh

아래와 같이 user-xxx.csv 사전이 추가된 모습을 볼 수 있습니다. 사실 아래 파일은 컴파일 되기 직전의 파일이며, 실제로 sys.dic 파일에 바이너리로 컴파일 되어 들어가게 됩니다.

    :::text
    mecab-ko-dic
    ├── ....
    ├── user-nnp.csv
    ├── user-person.csv
    ├── user-place.csv
    └── ...

## 설치
    :::text
    $ make install

