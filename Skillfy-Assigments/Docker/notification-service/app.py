import os
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({"status": "UP", "service": "Notification Service"}), 200

@app.route('/notify', methods=['POST'])
def send_notification():
    data = request.get_json() or {}
    recipient = data.get("to", "unknown@bank.com")
    channel = data.get("channel", "email")
    
    return jsonify({
        "status": "SENT",
        "recipient": recipient,
        "channel": channel,
        "message": "Transaction notification triggered successfully."
    }), 202

if __name__ == '__main__':
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)