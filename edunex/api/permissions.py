import frappe


def has_app_permission():
	"""Check if the user has permission to access the app."""
	if frappe.session.user == "Administrator":
		return True

	roles = frappe.get_roles()
	allowed_roles = ["EduNex Manager", "Education Manager", "Academics User", "System Manager"]
	if any(role in roles for role in allowed_roles):
		return True

	return False
