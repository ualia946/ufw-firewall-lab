# 🧪 ICMP (Ping) Behavior in UFW Firewall Lab

## 🔍 Observation

During testing, I noticed that even though I had configured:

```bash
sudo ufw default deny incoming
```

the virtual machine still responded to ICMP echo requests (`ping`) from my Mac. This was unexpected, as I assumed that denying all incoming traffic would also block ping.

---

## ❓ Why does ping still work?

Although `sudo ufw default deny incoming` blocks most incoming traffic, **UFW does not block ICMP (ping) by default**. This is a design decision to avoid accidental lockouts and to preserve diagnostic capabilities such as basic connectivity checks.

ICMP is handled differently than TCP and UDP, and unless a specific rule is created to block it, **ICMP packets (like ping) are still allowed**.

---

## 🔐 How to block ICMP (ping)

To block all ICMP traffic (such as ping requests), you must explicitly deny it using:

```bash
sudo ufw deny from any to any proto icmp
```

This rule tells UFW to deny **all ICMP packets** from any source to any destination.

---

## 🟢 How to allow ping only from a specific IP

If you want to allow ping only from a trusted device, such as your Mac at IP `192.168.1.131`, you can combine the rules:

```bash
sudo ufw allow from 192.168.1.131 to any proto icmp
sudo ufw deny from any to any proto icmp
```

The first rule is **more specific**, so UFW will allow pings from your Mac. The second rule blocks all other ICMP traffic.

---

## 📸 Related Screenshot

See the captured behavior in:

[`screenshots/ping_from_mac_to_vm.png`](../screenshots/ping_from_mac_to_vm.png)

This image shows that the VM responds to ping even though no ICMP-specific rules were defined yet.

---

## 🧠 Conclusion

This test demonstrates that:

- `default deny incoming` **does not block ping (ICMP)** by itself.
- ICMP must be blocked explicitly using a dedicated rule.
- You can fine-tune ICMP permissions to allow pings only from trusted sources.

This helped reinforce my understanding of how UFW treats protocol-specific traffic, and why explicit control is necessary when configuring firewalls securely.
