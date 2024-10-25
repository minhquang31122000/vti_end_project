import boto3
import psycopg2
from flask import Flask, jsonify

app = Flask(__name__)

# Hàm lấy thông tin credentials từ SSM
def get_ssm_parameters():
    ssm_client = boto3.client('ssm', region_name='ap-southeast-1')  # Đảm bảo cấu hình region
    db_username = ssm_client.get_parameter(Name='/rds/db/mq-peter-rds-postgres/superuser/username')['Parameter']['Value']
    db_password = ssm_client.get_parameter(Name='/rds/db/mq-peter-rds-postgres/superuser/password', WithDecryption=True)['Parameter']['Value']
    db_host_full =ssm_client.get_parameter(Name='/rds/db/mq-peter-rds-postgres/endpoint')['Parameter']['Value']
    db_name =ssm_client.get_parameter(Name='/rds/db/mq-peter-rds-postgres/dbname')['Parameter']['Value']

 

    db_host_arr = db_host_full.split(':')
    db_host = db_host_arr[0]
    db_port = db_host_arr[1]
    print("DB_USERNAME: ", db_username)
    print("DB_HOST: ", db_host)
    print("DB_NAME: ", db_name)
    print("DB_NAME: ", db_port)


    return db_username, db_password, db_host, db_name,db_port

# Kết nối tới PostgreSQL
def connect_to_db():
    try:
        db_username, db_password, db_host, db_name,db_port = get_ssm_parameters()
        connection = psycopg2.connect(
            dbname=db_name,
            user=db_username,
            password=db_password,
            host=db_host,
            port=db_port
        )
        return connection
    except Exception as e:
        print(f"Error connecting to database: {e}")
        return None

# API để truy vấn thông tin từ database
@app.route('/api/db-info', methods=['GET'])
def get_db_info():
    connection = connect_to_db()
    
    if connection:
        try:
            cursor = connection.cursor()
            cursor.execute("SELECT version();")
            db_version = cursor.fetchone()
            return jsonify({
                "db_version": db_version[0]
                }), 200
        except Exception as e:
            return jsonify({
                "error": str(e)
            }), 500
        finally:
            cursor.close()
            connection.close()
    else:
        return jsonify({
            "error": "Unable to connect to the database"
        }), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
