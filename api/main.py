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

# input data 넣을 디렉토리 만들어주기
@app.get("/createfolder")
async def create_folders():
    input_folder_path = os.path.join(os.getcwd(), 'input')
    cloth_folder_path = os.path.join(input_folder_path, 'cloth')
    image_folder_path = os.path.join(input_folder_path, 'image')
    
    if not os.path.exists(input_folder_path):
        os.mkdir(input_folder_path)
        os.mkdir(cloth_folder_path)
        os.mkdir(image_folder_path)
        return {"message": "Folders created successfully!"}
    else:
        return {"message": "Folder already exists!"}

@app.post("/photo")
async def upload_photo(file: UploadFile):

    UPLOAD_DIR = "./input/cloth"  
    
    content = await file.read()
    # 저장할 이미지 이름을 시간으로 변경
    filename = f"{int(time.time())}.png"  
    # 서버 로컬 스토리지에 이미지 저장 (쓰기)
    with open(os.path.join(UPLOAD_DIR, filename), "wb") as fp:
        fp.write(content)  

 
    return {"filename": filename}



