// services/email.go — tạo file mới

package services

import (
    "fmt"
    "log"
    "net/smtp"
    "os"
)

func SendResetEmail(username, resetLink string) error {
    smtpHost := os.Getenv("SMTP_HOST")
    smtpPort := os.Getenv("SMTP_PORT") // vd: "587"
    smtpUser := os.Getenv("SMTP_USER")
    smtpPass := os.Getenv("SMTP_PASS")
    fromEmail := os.Getenv("SMTP_FROM")

    if smtpHost == "" {
        // Dev mode — chỉ log ra console
        log.Printf("[DEV] Reset link for %s: %s", username, resetLink)
        return nil
    }

    body := fmt.Sprintf(
        "Subject: Đặt lại mật khẩu\r\n\r\n"+
            "Xin chào %s,\r\n\r\n"+
            "Click vào link sau để đặt lại mật khẩu (hết hạn sau 15 phút):\r\n%s\r\n\r\n"+
            "Nếu bạn không yêu cầu, hãy bỏ qua email này.",
        username, resetLink,
    )

    auth := smtp.PlainAuth("", smtpUser, smtpPass, smtpHost)
    return smtp.SendMail(
        smtpHost+":"+smtpPort,
        auth,
        fromEmail,
        []string{username}, // username là email
        []byte(body),
    )
}