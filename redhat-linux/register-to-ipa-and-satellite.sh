#!/bin/bash

# Author: Peace Diane Ishimwe
# Description: Register RHEL server to IPA and Red Hat Satellite

IPA_SERVER="ipa.domain.com"
IPA_DOMAIN="domain.com"
SATELLITE_SERVER="satellite.domain.com"
ACTIVATION_KEY="your-activation-key"
ORG="your-org"

echo "===== Starting Server Onboarding Process ====="

# Step 1: Install required packages
echo "Installing required packages..."
sudo yum install -y ipa-client subscription-manager

# Step 2: Configure IPA client
echo "Joining server to IPA domain..."
sudo ipa-client-install \
    --domain=$IPA_DOMAIN \
    --server=$IPA_SERVER \
    --mkhomedir \
    --unattended

# Step 3: Register with Red Hat Satellite
echo "Registering to Red Hat Satellite..."
sudo subscription-manager register \
    --org="$ORG" \
    --activationkey="$ACTIVATION_KEY"

# Step 4: Attach subscriptions (if required)
echo "Attaching subscriptions..."
sudo subscription-manager attach --auto

# Step 5: Enable required repositories
echo "Enabling repositories..."
sudo subscription-manager repos --enable=rhel-7-server-rpms

echo "===== Server successfully onboarded to IPA and Satellite ====="
