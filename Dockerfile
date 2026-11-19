FROM python:3.11-alpine

WORKDIR /app

# 如果 requirements.txt 中包含需要编译的 C 扩展（如部分网络/加密/系统库），按需安装构建依赖
# RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# 注意：Alpine 默认通常只有 python3，建议显式写 "python3"
CMD ["python3", "app.py"]