from fastapi import FastAPI
import uvicorn
import subprocess

# this presupposes that you have dns resolution for the hostname provided in place

app = FastAPI()
# host = '208.88.248.198'
# port = '27003'

@app.put('/hostname')
def hostname(hostname, ip):
    print(True)

@app.get('/lmutil')
def lmutil(port, hostname):
    cmd = (f'./lmutil lmstat -a -c {port}@{hostname}')
    status = subprocess.run(cmd, shell=True, capture_output=True)
    if status.returncode == 0:
        return status.stdout.decode('utf-8')

@app.get('/test')
def test():
    return "Hello, World!"

if __name__ == '__main__':
   uvicorn.run(app, host='0.0.0.0', port=5001)
