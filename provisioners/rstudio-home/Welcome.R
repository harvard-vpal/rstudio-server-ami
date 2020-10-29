# Run the below code or source this file to set a new password

pwd1 <- readline("Current password: ")
pwd2 <- readline("New password: ")

system(
	paste(
		"echo \"", pwd1, "\n", pwd2, "\n", pwd2, "\n\" | passwd",
		sep = ""
	)
)

rm(pwd1, pwd2)

# WARNING: it is strongly recommended that you clear the console so
# that the password is not visible.  Either press Ctrl+L or go
# to Edit -> Clear Console within the RStudio interface above.\n")

