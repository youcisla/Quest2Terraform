# test_crowdin.py
import pytest
import requests

def test_crowdin_api():
    # Test the Crowdin API endpoint
    url = "http://crowdin.exemple.test/api/project/info"
    response = requests.get(url)
    assert response.status_code == 200
    assert "project_id" in response.json()

def test_crowdin_web_ui():
    # Test the Crowdin web UI
    url = "http://crowdin.exemple.test"  #change with public ip addresse for the reverse_proxy with nginx
    response = requests.get(url)
    assert response.status_code == 200
    assert "Crowdin" in response.text