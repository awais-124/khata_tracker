@echo off
cd lib

:: Create folders
mkdir core\constants
mkdir core\services
mkdir core\utils

mkdir features\auth\presentation\screens
mkdir features\auth\presentation\widgets
mkdir features\debts\presentation\screens
mkdir features\debts\presentation\widgets
mkdir features\settings\presentation\screens
mkdir features\settings\presentation\widgets

mkdir shared\widgets
mkdir shared\models

:: Create core/constants files
type nul > core\constants\app_constants.dart
type nul > core\constants\firebase_constants.dart
type nul > core\constants\theme.dart

:: Create core/services files
type nul > core\services\auth_service.dart
type nul > core\services\debt_service.dart
type nul > core\services\notification_service.dart
type nul > core\services\pdf_service.dart

:: Create core/utils files
type nul > core\utils\extensions.dart
type nul > core\utils\formatters.dart
type nul > core\utils\validators.dart

:: Create auth files
type nul > features\auth\presentation\screens\login_screen.dart
type nul > features\auth\presentation\screens\register_screen.dart
type nul > features\auth\presentation\screens\reset_password_screen.dart
type nul > features\auth\presentation\widgets\auth_form.dart
type nul > features\auth\presentation\widgets\social_auth_buttons.dart
type nul > features\auth\auth_controller.dart

:: Create debts files
type nul > features\debts\presentation\screens\add_edit_debt_screen.dart
type nul > features\debts\presentation\screens\debt_detail_screen.dart
type nul > features\debts\presentation\screens\debts_screen.dart
type nul > features\debts\presentation\screens\history_screen.dart
type nul > features\debts\presentation\widgets\debt_card.dart
type nul > features\debts\presentation\widgets\debt_filter.dart
type nul > features\debts\presentation\widgets\debt_list.dart
type nul > features\debts\presentation\widgets\debt_summary.dart
type nul > features\debts\debt_controller.dart

:: Create settings files
type nul > features\settings\presentation\screens\settings_screen.dart
type nul > features\settings\presentation\widgets\theme_switcher.dart
type nul > features\settings\settings_controller.dart

:: Create shared files
type nul > shared\widgets\app_drawer.dart
type nul > shared\widgets\app_scaffold.dart
type nul > shared\widgets\custom_app_bar.dart
type nul > shared\widgets\custom_button.dart
type nul > shared\widgets\custom_text_field.dart
type nul > shared\widgets\loading_indicator.dart
type nul > shared\models\debt_model.dart

echo Folder structure and files created successfully!
pause
