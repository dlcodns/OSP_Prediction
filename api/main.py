from fastapi import FastAPI
from fastapi import File, UploadFile
import os, time

app = FastAPI()


#메인 페이지 접속 시 보여줌
@app.get("/")   
def getModel():
    return 'hello'

# for test
@app.get("/data")
def getData():
    return {'hello':1234}

# @app.post("/files/")
# async def create_file(file: Annotated[bytes, File()]):
#     return {"file_size": len(file)}


# @app.post("/uploadfile/")
# async def create_upload_file(file: UploadFile):
#     return {"filename": file.filename}

@app.post("/photo")
async def upload_photo(file: UploadFile):
    # 이미지를 저장할 경로 (나중에 디비 경로 적어주기)
    UPLOAD_DIR = "./"  
    
    content = await file.read()
    # 저장할 이미지 이름을 시간으로 변경
    filename = f"{int(time.time())}.png"  
    # 서버 로컬 스토리지에 이미지 저장 (쓰기)
    with open(os.path.join(UPLOAD_DIR, filename), "wb") as fp:
        fp.write(content)  

 
    return {"filename": filename}



