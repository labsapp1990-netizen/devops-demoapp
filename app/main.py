from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/')
def home():
    return f"Hello from {os.environ.get('HOSTNAME', 'local')}"

@app.route('/health')
def health():
    return jsonify(status='ok'), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
# test CI/CD
# test CI/CD Tue May 12 14:24:04 UTC 2026
# final test Tue May 12 14:31:14 UTC 2026
# retest connection Tue May 12 14:46:05 UTC 2026
# auto-deploy test Tue May 12 14:47:24 UTC 2026
# final working Tue May 12 14:53:23 UTC 2026
