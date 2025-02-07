# 使用 Python 官方映像檔
FROM python:3.9-slim

# 設置工作目錄
WORKDIR /app

# 複製所需文件
COPY requirements.txt .
COPY SimHei.ttf .
COPY sql.json .
COPY app.py .
COPY static/ ./static/
COPY templates/ ./templates/

# 安裝依賴
RUN pip install --no-cache-dir -r requirements.txt

# 創建 static/images 目錄
RUN mkdir -p static/images

# 設置環境變數
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# 開放端口
EXPOSE 5000

# 運行應用
CMD ["flask", "run", "--host=0.0.0.0"]