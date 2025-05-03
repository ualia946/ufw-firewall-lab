# 🔐 Difference Between ACL and Firewall

This document explains the key differences between Access Control Lists (ACLs) and Firewalls, based on practical understanding and real lab experience.

---

## 🧱 1. Filtering Capabilities

- **ACLs** can filter packets based on information **up to the Transport layer** (Layer 4 of the OSI model), such as:
  - Source IP
  - Destination IP
  - Protocol (TCP, UDP)
  - Port numbers

- **Firewalls** can filter traffic **beyond Layer 4**, including **Application Layer (Layer 7)** data. This means they can inspect:
  - HTTP headers
  - DNS queries
  - Application-specific content

> 🔸 **Note on UFW:**  
> UFW (Uncomplicated Firewall) is a user-friendly software interface for `iptables`, the native Linux firewall.  
> While it simplifies the configuration of firewall rules, **UFW does not natively support deep packet inspection** beyond the Transport layer.  
> Therefore, UFW behaves similarly to ACLs in terms of layer visibility.

---

## 🧠 2. Stateful vs Stateless

- **ACLs are stateless**: They treat each packet independently. They do not remember if a connection was previously established.
- **Firewalls are stateful**: They keep track of active connections and can determine if a packet is part of an established session or not.

**Example:**  
With the rules:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

A firewall will **allow replies** to outgoing connections initiated by the host (e.g., a web request), but **deny unsolicited incoming requests**. ACLs cannot achieve this behavior without additional logic.

---

## 🧩 3. Deployment Scope

- **Firewalls** can be:
  - Hardware or software based
  - Applied at network borders (perimeter firewalls)
  - Installed directly on devices (host firewalls)

- **ACLs** are applied **only on router interfaces**, and packet filtering is handled by the router itself.

---

## ✅ 4. Conclusion

While both ACLs and Firewalls are used for traffic filtering and network security, **firewalls provide a more flexible, stateful, and deep-inspection approach**, making them better suited for modern security requirements.

For fine-grained and application-aware security, **a firewall is the superior option**.

However, in the case of UFW, its capabilities are limited to what `iptables` can do through simplified syntax, and therefore it does **not provide full Layer 7 filtering capabilities**.
