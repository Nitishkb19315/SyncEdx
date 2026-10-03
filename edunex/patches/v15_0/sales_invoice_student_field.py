import frappe
from frappe.custom.doctype.custom_field.custom_field import create_custom_fields
from edunex.install import get_custom_fields


def execute():
	create_custom_fields(get_custom_fields())
