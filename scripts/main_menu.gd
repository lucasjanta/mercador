extends Control

@onready var email_input: LineEdit = $PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/VBoxContainer/EmailInput
@onready var password_input: LineEdit = $PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/VBoxContainer2/PasswordInput
@onready var status_label: Label = $PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/StatusLabel

func _ready():
	Firebase.Auth.login_succeeded.connect(_on_FirebaseAuth_login_succeeded)
	Firebase.Auth.signup_succeeded.connect(_on_FirebaseAuth_login_succeeded)
	Firebase.Auth.login_failed.connect(on_login_failed)
	Firebase.Auth.signup_failed.connect(on_signup_failed)


func _on_login_button_pressed() -> void:
	status_label.text = "Autenticando..."
	status_label.modulate = Color(0.0, 1.0, 0.0, 1.0)
	var email = email_input.text
	var password = password_input.text
	Firebase.Auth.login_with_email_and_password(email, password)

func _on_register_pressed():
	var email = email_input.text
	var password = password_input.text
	Firebase.Auth.signup_with_email_and_password(email, password)

func _on_FirebaseAuth_login_succeeded(auth):
		# You do not need to call get_user_data() here, as auth is the same variable
	print(auth)
	Global.auth_info = auth
	get_tree().change_scene_to_file("res://scenes/home.tscn")
	
func on_login_failed(error_code, message):
	if message == "INVALID_EMAIL":
		status_label.text = "Email inválido"
		status_label.modulate = Color(1.0, 0.0, 0.0, 1.0)
		print("n sei pq o status_label n ta atualizando")
	elif message == "INVALID_LOGIN_CREDENTIALS":
		status_label.text = "Senha inválida"
		status_label.modulate = Color(1.0, 0.0, 0.0, 1.0)
	print("error code: " + str(error_code))
	print("message: " + str(message))

func on_signup_failed(error_code, message):
	print("error code: " + str(error_code))
	print("message: " + str(message))
