.class public Lcom/android/settings/wifi/WifiSettings;
.super Landroid/preference/PreferenceActivity;
.source "WifiSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/wifi/WifiSettings$Scanner;
    }
.end annotation


# static fields
.field private static final sLock:Ljava/lang/Object;


# instance fields
.field private mAccessPoints:Lcom/android/settings/ProgressCategory;

.field private mAddNetwork:Landroid/preference/Preference;

.field private mAutoConnect:Landroid/preference/CheckBoxPreference;

.field private mConnectivityManager:Landroid/net/ConnectivityManager;

.field private mDialog:Lcom/android/settings/wifi/WifiDialog;

.field private final mFilter:Landroid/content/IntentFilter;

.field mHandler:Landroid/os/Handler;

.field private mKeyStoreNetworkId:I

.field private mLastInfo:Landroid/net/wifi/WifiInfo;

.field private mLastPriority:I

.field private mLastState:Landroid/net/NetworkInfo$DetailedState;

.field private mNotifyOpenNetworks:Landroid/preference/CheckBoxPreference;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mResetNetworks:Z

.field private final mScanner:Lcom/android/settings/wifi/WifiSettings$Scanner;

.field private mSelected:Lcom/android/settings/wifi/AccessPoint;

.field private mTrustList:Landroid/preference/Preference;

.field private mWifiEnabler:Lcom/android/settings/wifi/WifiEnabler;

.field private mWifiManager:Landroid/net/wifi/WifiManager;

.field private results:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/wifi/ScanResult;",
            ">;"
        }
    .end annotation
.end field

.field private supportCMCC:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 91
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/settings/wifi/WifiSettings;->sLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 106
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 93
    iput-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->results:Ljava/util/List;

    .line 94
    iput-boolean v1, p0, Lcom/android/settings/wifi/WifiSettings;->mResetNetworks:Z

    .line 95
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/settings/wifi/WifiSettings;->mKeyStoreNetworkId:I

    .line 104
    iput-boolean v1, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    .line 701
    new-instance v0, Lcom/android/settings/wifi/WifiSettings$4;

    invoke-direct {v0, p0}, Lcom/android/settings/wifi/WifiSettings$4;-><init>(Lcom/android/settings/wifi/WifiSettings;)V

    iput-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mHandler:Landroid/os/Handler;

    .line 107
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    iput-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    .line 108
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 109
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.SCAN_RESULTS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 110
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.NETWORK_IDS_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 111
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 112
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 113
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 115
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.net.wifi.realtek.WIFI_PASSWOED_ERROR"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "com.spreadtrum.WIFI_TRUST_AP_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 119
    new-instance v0, Lcom/android/settings/wifi/WifiSettings$1;

    invoke-direct {v0, p0}, Lcom/android/settings/wifi/WifiSettings$1;-><init>(Lcom/android/settings/wifi/WifiSettings;)V

    iput-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 126
    new-instance v0, Lcom/android/settings/wifi/WifiSettings$Scanner;

    invoke-direct {v0, p0, v2}, Lcom/android/settings/wifi/WifiSettings$Scanner;-><init>(Lcom/android/settings/wifi/WifiSettings;Lcom/android/settings/wifi/WifiSettings$1;)V

    iput-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mScanner:Lcom/android/settings/wifi/WifiSettings$Scanner;

    .line 127
    return-void
.end method

.method static synthetic access$000(Lcom/android/settings/wifi/WifiSettings;Landroid/content/Intent;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lcom/android/settings/wifi/WifiSettings;->handleEvent(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/settings/wifi/WifiSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->enableNetworks()V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/settings/wifi/WifiSettings;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget v0, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    return v0
.end method

.method static synthetic access$1102(Lcom/android/settings/wifi/WifiSettings;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 67
    iput p1, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    return p1
.end method

.method static synthetic access$1200(Lcom/android/settings/wifi/WifiSettings;Lcom/android/settings/wifi/AccessPoint;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lcom/android/settings/wifi/WifiSettings;->sendUpdateTrustedApBroadcast(Lcom/android/settings/wifi/AccessPoint;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/settings/wifi/WifiSettings;)Landroid/net/wifi/WifiManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/settings/wifi/WifiSettings;)Landroid/net/wifi/WifiInfo;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    return-object v0
.end method

.method static synthetic access$302(Lcom/android/settings/wifi/WifiSettings;Landroid/net/wifi/WifiInfo;)Landroid/net/wifi/WifiInfo;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 67
    iput-object p1, p0, Lcom/android/settings/wifi/WifiSettings;->mLastInfo:Landroid/net/wifi/WifiInfo;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/settings/wifi/WifiSettings;)Landroid/net/NetworkInfo$DetailedState;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    return-object v0
.end method

.method static synthetic access$402(Lcom/android/settings/wifi/WifiSettings;Landroid/net/NetworkInfo$DetailedState;)Landroid/net/NetworkInfo$DetailedState;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 67
    iput-object p1, p0, Lcom/android/settings/wifi/WifiSettings;->mLastState:Landroid/net/NetworkInfo$DetailedState;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/settings/wifi/WifiSettings;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->results:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$502(Lcom/android/settings/wifi/WifiSettings;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 67
    iput-object p1, p0, Lcom/android/settings/wifi/WifiSettings;->results:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$600()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 67
    sget-object v0, Lcom/android/settings/wifi/WifiSettings;->sLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/settings/wifi/WifiSettings;)Lcom/android/settings/ProgressCategory;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/settings/wifi/WifiSettings;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/android/settings/wifi/WifiSettings;->mResetNetworks:Z

    return v0
.end method

.method static synthetic access$900(Lcom/android/settings/wifi/WifiSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->updateAccessPoints()V

    return-void
.end method

.method private addPriority(Ljava/lang/String;)I
    .locals 11
    .parameter "ssid"

    .prologue
    const/4 v2, 0x0

    .line 882
    const/4 v8, -0x1

    .line 883
    .local v8, priority:I
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move v9, v8

    .line 911
    .end local v8           #priority:I
    .local v9, priority:I
    :goto_0
    return v9

    .line 886
    .end local v9           #priority:I
    .restart local v8       #priority:I
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/settings/wifi/WifiTrustedAPList;->TRUSTED_LIST_URI:Landroid/net/Uri;

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 888
    .local v6, cursor:Landroid/database/Cursor;
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/settings/wifi/WifiTrustedAPList;->TRUSTED_LIST_URI:Landroid/net/Uri;

    const-string v3, "ssid=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 892
    .local v7, cursorQuery:Landroid/database/Cursor;
    :try_start_0
    new-instance v10, Landroid/content/ContentValues;

    invoke-direct {v10}, Landroid/content/ContentValues;-><init>()V

    .line 893
    .local v10, values:Landroid/content/ContentValues;
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v8

    .line 894
    if-eqz v7, :cond_4

    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_4

    .line 895
    const-string v0, "ssid"

    invoke-virtual {v10, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 896
    const-string v0, "priority"

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, v8}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v10, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 897
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/settings/wifi/WifiTrustedAPList;->TRUSTED_LIST_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v10}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 904
    :goto_1
    if-eqz v6, :cond_2

    .line 905
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 907
    :cond_2
    if-eqz v7, :cond_3

    .line 908
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_3
    move v9, v8

    .line 911
    .end local v8           #priority:I
    .restart local v9       #priority:I
    goto :goto_0

    .line 901
    .end local v9           #priority:I
    .restart local v8       #priority:I
    :cond_4
    const/4 v8, -0x1

    goto :goto_1

    .line 904
    .end local v10           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_5

    .line 905
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 907
    :cond_5
    if-eqz v7, :cond_6

    .line 908
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_6
    throw v0
.end method

.method private connect(I)V
    .locals 11
    .parameter "networkId"

    .prologue
    const/4 v10, 0x0

    const/4 v9, -0x1

    const/4 v8, 0x1

    .line 459
    if-ne p1, v9, :cond_0

    .line 503
    :goto_0
    return-void

    .line 464
    :cond_0
    iget v6, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    const v7, 0xf4240

    if-le v6, v7, :cond_3

    .line 465
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    invoke-virtual {v6}, Lcom/android/settings/ProgressCategory;->getPreferenceCount()I

    move-result v6

    sub-int v3, v6, v8

    .local v3, i:I
    :goto_1
    if-ltz v3, :cond_2

    .line 466
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    invoke-virtual {v6, v3}, Lcom/android/settings/ProgressCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/settings/wifi/AccessPoint;

    .line 467
    .local v0, accessPoint:Lcom/android/settings/wifi/AccessPoint;
    iget v6, v0, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    if-eq v6, v9, :cond_1

    .line 468
    new-instance v1, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v1}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 469
    .local v1, config:Landroid/net/wifi/WifiConfiguration;
    iget v6, v0, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    iput v6, v1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    .line 470
    iput v10, v1, Landroid/net/wifi/WifiConfiguration;->priority:I

    .line 471
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6, v1}, Landroid/net/wifi/WifiManager;->updateNetwork(Landroid/net/wifi/WifiConfiguration;)I

    .line 465
    .end local v1           #config:Landroid/net/wifi/WifiConfiguration;
    :cond_1
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 474
    .end local v0           #accessPoint:Lcom/android/settings/wifi/AccessPoint;
    :cond_2
    iput v10, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    .line 478
    .end local v3           #i:I
    :cond_3
    new-instance v1, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v1}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 479
    .restart local v1       #config:Landroid/net/wifi/WifiConfiguration;
    iput p1, v1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    .line 480
    iget v6, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    iput v6, v1, Landroid/net/wifi/WifiConfiguration;->priority:I

    .line 481
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6, v1}, Landroid/net/wifi/WifiManager;->updateNetwork(Landroid/net/wifi/WifiConfiguration;)I

    .line 482
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->saveNetworks()V

    .line 485
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v2

    .line 486
    .local v2, configs:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    if-eqz v2, :cond_5

    .line 487
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/wifi/WifiConfiguration;

    .line 488
    .local v5, wifi_config:Landroid/net/wifi/WifiConfiguration;
    iget v6, v5, Landroid/net/wifi/WifiConfiguration;->priority:I

    iget v7, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    if-ne v6, v7, :cond_4

    .line 489
    iget p1, v5, Landroid/net/wifi/WifiConfiguration;->networkId:I

    .line 497
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #wifi_config:Landroid/net/wifi/WifiConfiguration;
    :cond_5
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6, p1, v8}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 499
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 501
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->reconnect()Z

    .line 502
    iput-boolean v8, p0, Lcom/android/settings/wifi/WifiSettings;->mResetNetworks:Z

    goto :goto_0
.end method

.method private deletePriority(Ljava/lang/String;)V
    .locals 5
    .parameter "ssid"

    .prologue
    .line 916
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 921
    :cond_0
    :goto_0
    return-void

    .line 919
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/settings/wifi/WifiTrustedAPList;->TRUSTED_LIST_URI:Landroid/net/Uri;

    const-string v2, "ssid=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0
.end method

.method private enableNetworks()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 557
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    invoke-virtual {v2}, Lcom/android/settings/ProgressCategory;->getPreferenceCount()I

    move-result v2

    const/4 v3, 0x1

    sub-int v1, v2, v3

    .local v1, i:I
    :goto_0
    if-ltz v1, :cond_1

    .line 558
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    invoke-virtual {v2, v1}, Lcom/android/settings/ProgressCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/android/settings/wifi/AccessPoint;

    invoke-virtual {v2}, Lcom/android/settings/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 559
    .local v0, config:Landroid/net/wifi/WifiConfiguration;
    if-eqz v0, :cond_0

    iget v2, v0, Landroid/net/wifi/WifiConfiguration;->status:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    .line 560
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget v3, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    invoke-virtual {v2, v3, v4}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 557
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 563
    .end local v0           #config:Landroid/net/wifi/WifiConfiguration;
    :cond_1
    iput-boolean v4, p0, Lcom/android/settings/wifi/WifiSettings;->mResetNetworks:Z

    .line 564
    return-void
.end method

.method private forget(I)V
    .locals 1
    .parameter "networkId"

    .prologue
    .line 454
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0, p1}, Landroid/net/wifi/WifiManager;->removeNetwork(I)Z

    .line 455
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->saveNetworks()V

    .line 456
    return-void
.end method

.method private getListData()[Ljava/lang/String;
    .locals 11

    .prologue
    const/4 v2, 0x0

    .line 936
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/settings/wifi/WifiTrustedAPList;->TRUSTED_LIST_URI:Landroid/net/Uri;

    const-string v5, "priority ASC"

    move-object v3, v2

    move-object v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 939
    .local v6, cursor:Landroid/database/Cursor;
    const/4 v10, 0x0

    .line 941
    .local v10, ssids:[Ljava/lang/String;
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v8

    .line 942
    .local v8, num:I
    const/4 v7, 0x0

    .line 943
    .local v7, i:I
    const-string v0, "ssid"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    .line 944
    .local v9, ssidColumnIndex:I
    new-array v10, v8, [Ljava/lang/String;

    .line 945
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 946
    invoke-interface {v6, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v10, v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 947
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 950
    :cond_0
    if-eqz v6, :cond_1

    .line 951
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 954
    :cond_1
    return-object v10

    .line 950
    .end local v7           #i:I
    .end local v8           #num:I
    .end local v9           #ssidColumnIndex:I
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 951
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method private handleEvent(Landroid/content/Intent;)V
    .locals 14
    .parameter "intent"

    .prologue
    const/4 v13, 0x0

    const/4 v9, 0x1

    const/4 v12, -0x1

    const/4 v11, -0x2

    const/4 v10, 0x0

    .line 596
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 597
    .local v0, action:Ljava/lang/String;
    const-string v8, "android.net.wifi.WIFI_STATE_CHANGED"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 598
    const-string v8, "wifi_state"

    const/4 v9, 0x4

    invoke-virtual {p1, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    invoke-direct {p0, v8}, Lcom/android/settings/wifi/WifiSettings;->updateWifiState(I)V

    .line 660
    :cond_0
    :goto_0
    return-void

    .line 600
    :cond_1
    const-string v8, "android.net.wifi.SCAN_RESULTS"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 602
    sget-object v8, Lcom/android/settings/wifi/WifiSettings;->sLock:Ljava/lang/Object;

    monitor-enter v8

    .line 603
    :try_start_0
    iget-object v9, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/android/settings/ProgressCategory;->setProgress(Z)V

    .line 604
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 606
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->updateAccessPoints()V

    goto :goto_0

    .line 604
    :catchall_0
    move-exception v9

    :try_start_1
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v9

    .line 607
    :cond_2
    const-string v8, "android.net.wifi.NETWORK_IDS_CHANGED"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 608
    iget-object v8, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v8, v8, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    if-eq v8, v12, :cond_3

    .line 609
    iput-object v13, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    .line 611
    :cond_3
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->updateAccessPoints()V

    goto :goto_0

    .line 612
    :cond_4
    const-string v8, "android.net.wifi.supplicant.STATE_CHANGE"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 613
    const-string v8, "newState"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Landroid/net/wifi/SupplicantState;

    invoke-static {v8}, Landroid/net/wifi/WifiInfo;->getDetailedStateOf(Landroid/net/wifi/SupplicantState;)Landroid/net/NetworkInfo$DetailedState;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_0

    .line 615
    :cond_5
    const-string v8, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 616
    const-string v8, "networkInfo"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Landroid/net/NetworkInfo;

    invoke-virtual {v8}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_0

    .line 618
    :cond_6
    const-string v8, "android.net.wifi.RSSI_CHANGED"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 619
    invoke-direct {p0, v13}, Lcom/android/settings/wifi/WifiSettings;->updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V

    goto :goto_0

    .line 622
    :cond_7
    const-string v8, "com.spreadtrum.WIFI_TRUST_AP_UPDATE"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 623
    const-string v8, "lu"

    const-string v9, "handle WIFI_TRUST_AP_UPDATE_ACTION"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 624
    const-string v8, "SSID"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 625
    .local v6, ssid:Ljava/lang/String;
    const-string v8, "SELECT_TRUST"

    invoke-virtual {p1, v8, v10}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    .line 627
    .local v5, selectTrust:Z
    if-eqz v5, :cond_8

    .line 628
    invoke-direct {p0, v6}, Lcom/android/settings/wifi/WifiSettings;->addPriority(Ljava/lang/String;)I

    move-result v4

    .line 630
    .local v4, priority:I
    if-eq v4, v12, :cond_0

    .line 631
    iget-object v8, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v8, v6, v4}, Landroid/net/wifi/WifiManager;->setTrustListPriority(Ljava/lang/String;I)Z

    .line 632
    iget-object v8, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    const-string v9, "add"

    invoke-virtual {v8, v9, v11}, Landroid/net/wifi/WifiManager;->setTrustListPriority(Ljava/lang/String;I)Z

    goto/16 :goto_0

    .line 638
    .end local v4           #priority:I
    :cond_8
    invoke-direct {p0, v6}, Lcom/android/settings/wifi/WifiSettings;->deletePriority(Ljava/lang/String;)V

    .line 640
    iget-object v8, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    const/4 v9, -0x5

    invoke-virtual {v8, v6, v9}, Landroid/net/wifi/WifiManager;->setTrustListPriority(Ljava/lang/String;I)Z

    .line 641
    iget-object v8, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    const-string v9, "delete"

    invoke-virtual {v8, v9, v11}, Landroid/net/wifi/WifiManager;->setTrustListPriority(Ljava/lang/String;I)Z

    .line 643
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->getListData()[Ljava/lang/String;

    move-result-object v7

    .line 644
    .local v7, ssids:[Ljava/lang/String;
    array-length v2, v7

    .line 645
    .local v2, length:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v2, :cond_0

    .line 646
    aget-object v8, v7, v1

    invoke-direct {p0, v8, v1}, Lcom/android/settings/wifi/WifiSettings;->setPriority(Ljava/lang/String;I)I

    .line 645
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 651
    .end local v1           #i:I
    .end local v2           #length:I
    .end local v5           #selectTrust:Z
    .end local v6           #ssid:Ljava/lang/String;
    .end local v7           #ssids:[Ljava/lang/String;
    :cond_9
    const-string v8, "android.net.wifi.realtek.WIFI_PASSWOED_ERROR"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 652
    const-string v8, "networkid"

    invoke-virtual {p1, v8, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 653
    .local v3, networkId:I
    iget-object v8, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-virtual {v8, v3}, Lcom/android/settings/wifi/AccessPoint;->setnetworkid(I)V

    .line 654
    iget-object v8, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iput v9, v8, Lcom/android/settings/wifi/AccessPoint;->passworderror:I

    .line 655
    iget-object v8, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v8}, Landroid/net/wifi/WifiManager;->noconnectAP()Z

    .line 656
    iget-object v8, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-direct {p0, v8, v9}, Lcom/android/settings/wifi/WifiSettings;->showDialog(Lcom/android/settings/wifi/AccessPoint;Z)V

    goto/16 :goto_0
.end method

.method private isTrustedAP(Ljava/lang/String;)Z
    .locals 8
    .parameter "ssid"

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x0

    .line 860
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move v0, v5

    .line 876
    :goto_0
    return v0

    .line 863
    :cond_1
    const/4 v7, 0x0

    .line 864
    .local v7, isTrustedAP:Z
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/settings/wifi/WifiTrustedAPList;->TRUSTED_LIST_URI:Landroid/net/Uri;

    const-string v3, "ssid=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    aput-object p1, v4, v5

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 868
    .local v6, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_2

    .line 869
    const/4 v7, 0x1

    .line 872
    :cond_2
    if-eqz v6, :cond_3

    .line 873
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    move v0, v7

    .line 876
    goto :goto_0

    .line 872
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    .line 873
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0
.end method

.method private manualconnect(I)V
    .locals 11
    .parameter "networkId"

    .prologue
    const/4 v10, 0x0

    const/4 v9, -0x1

    const/4 v8, 0x1

    .line 506
    if-ne p1, v9, :cond_0

    .line 554
    :goto_0
    return-void

    .line 511
    :cond_0
    iget v6, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    const v7, 0xf4240

    if-le v6, v7, :cond_3

    .line 513
    sget-object v6, Lcom/android/settings/wifi/WifiSettings;->sLock:Ljava/lang/Object;

    monitor-enter v6

    .line 514
    :try_start_0
    iget-object v7, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    invoke-virtual {v7}, Lcom/android/settings/ProgressCategory;->getPreferenceCount()I

    move-result v7

    sub-int v3, v7, v8

    .local v3, i:I
    :goto_1
    if-ltz v3, :cond_2

    .line 515
    iget-object v7, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    invoke-virtual {v7, v3}, Lcom/android/settings/ProgressCategory;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/settings/wifi/AccessPoint;

    .line 516
    .local v0, accessPoint:Lcom/android/settings/wifi/AccessPoint;
    iget v7, v0, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    if-eq v7, v9, :cond_1

    .line 517
    new-instance v1, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v1}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 518
    .local v1, config:Landroid/net/wifi/WifiConfiguration;
    iget v7, v0, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    iput v7, v1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    .line 519
    const/4 v7, 0x0

    iput v7, v1, Landroid/net/wifi/WifiConfiguration;->priority:I

    .line 520
    iget-object v7, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v7, v1}, Landroid/net/wifi/WifiManager;->updateNetwork(Landroid/net/wifi/WifiConfiguration;)I

    .line 514
    .end local v1           #config:Landroid/net/wifi/WifiConfiguration;
    :cond_1
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 523
    .end local v0           #accessPoint:Lcom/android/settings/wifi/AccessPoint;
    :cond_2
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 525
    iput v10, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    .line 529
    .end local v3           #i:I
    :cond_3
    new-instance v1, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v1}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 530
    .restart local v1       #config:Landroid/net/wifi/WifiConfiguration;
    iput p1, v1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    .line 531
    iget v6, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    iput v6, v1, Landroid/net/wifi/WifiConfiguration;->priority:I

    .line 532
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6, v1}, Landroid/net/wifi/WifiManager;->updateNetwork(Landroid/net/wifi/WifiConfiguration;)I

    .line 533
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->saveNetworks()V

    .line 536
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v2

    .line 537
    .local v2, configs:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    if-eqz v2, :cond_5

    .line 538
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/wifi/WifiConfiguration;

    .line 539
    .local v5, wifi_config:Landroid/net/wifi/WifiConfiguration;
    iget v6, v5, Landroid/net/wifi/WifiConfiguration;->priority:I

    iget v7, p0, Lcom/android/settings/wifi/WifiSettings;->mLastPriority:I

    if-ne v6, v7, :cond_4

    .line 540
    iget p1, v5, Landroid/net/wifi/WifiConfiguration;->networkId:I

    .line 548
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #wifi_config:Landroid/net/wifi/WifiConfiguration;
    :cond_5
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6, p1, v8}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 550
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 552
    iget-object v6, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->reconnectAP()Z

    .line 553
    iput-boolean v8, p0, Lcom/android/settings/wifi/WifiSettings;->mResetNetworks:Z

    goto :goto_0

    .line 523
    .end local v1           #config:Landroid/net/wifi/WifiConfiguration;
    .end local v2           #configs:Ljava/util/List;,"Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    :catchall_0
    move-exception v7

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v7
.end method

.method private requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z
    .locals 2
    .parameter "config"

    .prologue
    const/4 v1, 0x1

    .line 444
    invoke-static {p1}, Lcom/android/settings/wifi/WifiDialog;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v0

    invoke-virtual {v0}, Landroid/security/KeyStore;->test()I

    move-result v0

    if-eq v0, v1, :cond_0

    .line 446
    iget v0, p1, Landroid/net/wifi/WifiConfiguration;->networkId:I

    iput v0, p0, Lcom/android/settings/wifi/WifiSettings;->mKeyStoreNetworkId:I

    .line 447
    invoke-static {}, Landroid/security/Credentials;->getInstance()Landroid/security/Credentials;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/security/Credentials;->unlock(Landroid/content/Context;)V

    move v0, v1

    .line 450
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private saveNetworks()V
    .locals 1

    .prologue
    .line 568
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->enableNetworks()V

    .line 569
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    .line 570
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 571
    return-void
.end method

.method private sendUpdateTrustedApBroadcast(Lcom/android/settings/wifi/AccessPoint;)V
    .locals 3
    .parameter "accessPoint"

    .prologue
    .line 843
    if-eqz p1, :cond_1

    .line 844
    iget-boolean v1, p1, Lcom/android/settings/wifi/AccessPoint;->isTrusted:Z

    if-nez v1, :cond_0

    iget v1, p1, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 845
    :cond_0
    iget-boolean v1, p1, Lcom/android/settings/wifi/AccessPoint;->isTrusted:Z

    iget-boolean v2, p1, Lcom/android/settings/wifi/AccessPoint;->selectTrust:Z

    if-eq v1, v2, :cond_1

    .line 847
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.spreadtrum.WIFI_TRUST_AP_UPDATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 849
    .local v0, broadcast:Landroid/content/Intent;
    const-string v1, "SSID"

    iget-object v2, p1, Lcom/android/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 850
    const-string v1, "SELECT_TRUST"

    iget-boolean v2, p1, Lcom/android/settings/wifi/AccessPoint;->selectTrust:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 851
    invoke-virtual {p0, v0}, Lcom/android/settings/wifi/WifiSettings;->sendBroadcast(Landroid/content/Intent;)V

    .line 852
    const-string v1, "lu"

    const-string v2, "sendUpdateTrustedApBroadcast"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 856
    .end local v0           #broadcast:Landroid/content/Intent;
    :cond_1
    return-void
.end method

.method private setPriority(Ljava/lang/String;I)I
    .locals 6
    .parameter "ssid"
    .parameter "priority"

    .prologue
    .line 925
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 926
    :cond_0
    const/4 v1, -0x1

    .line 930
    :goto_0
    return v1

    .line 928
    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 929
    .local v0, values:Landroid/content/ContentValues;
    const-string v1, "priority"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 930
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/android/settings/wifi/WifiTrustedAPList;->TRUSTED_LIST_URI:Landroid/net/Uri;

    const-string v3, "ssid=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_0
.end method

.method private showDialog(Lcom/android/settings/wifi/AccessPoint;Z)V
    .locals 1
    .parameter "accessPoint"
    .parameter "edit"

    .prologue
    .line 436
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mDialog:Lcom/android/settings/wifi/WifiDialog;

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mDialog:Lcom/android/settings/wifi/WifiDialog;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiDialog;->dismiss()V

    .line 439
    :cond_0
    new-instance v0, Lcom/android/settings/wifi/WifiDialog;

    invoke-direct {v0, p0, p0, p1, p2}, Lcom/android/settings/wifi/WifiDialog;-><init>(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Lcom/android/settings/wifi/AccessPoint;Z)V

    iput-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mDialog:Lcom/android/settings/wifi/WifiDialog;

    .line 440
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mDialog:Lcom/android/settings/wifi/WifiDialog;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiDialog;->show()V

    .line 441
    return-void
.end method

.method private updateAccessPoints()V
    .locals 1

    .prologue
    .line 575
    new-instance v0, Lcom/android/settings/wifi/WifiSettings$2;

    invoke-direct {v0, p0}, Lcom/android/settings/wifi/WifiSettings$2;-><init>(Lcom/android/settings/wifi/WifiSettings;)V

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiSettings$2;->start()V

    .line 593
    return-void
.end method

.method private updateConnectionState(Landroid/net/NetworkInfo$DetailedState;)V
    .locals 1
    .parameter "state"

    .prologue
    .line 664
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 665
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mScanner:Lcom/android/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 699
    :goto_0
    return-void

    .line 670
    :cond_0
    sget-object v0, Landroid/net/NetworkInfo$DetailedState;->AUTHENTICATING:Landroid/net/NetworkInfo$DetailedState;

    if-eq p1, v0, :cond_1

    sget-object v0, Landroid/net/NetworkInfo$DetailedState;->OBTAINING_IPADDR:Landroid/net/NetworkInfo$DetailedState;

    if-eq p1, v0, :cond_1

    sget-object v0, Landroid/net/NetworkInfo$DetailedState;->CONNECTING:Landroid/net/NetworkInfo$DetailedState;

    if-eq p1, v0, :cond_1

    sget-object v0, Landroid/net/NetworkInfo$DetailedState;->CONNECTED:Landroid/net/NetworkInfo$DetailedState;

    if-ne p1, v0, :cond_2

    .line 672
    :cond_1
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->enableNetworks()V

    .line 676
    :cond_2
    sget-object v0, Landroid/net/NetworkInfo$DetailedState;->OBTAINING_IPADDR:Landroid/net/NetworkInfo$DetailedState;

    if-ne p1, v0, :cond_3

    .line 677
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mScanner:Lcom/android/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 682
    :goto_1
    new-instance v0, Lcom/android/settings/wifi/WifiSettings$3;

    invoke-direct {v0, p0, p1}, Lcom/android/settings/wifi/WifiSettings$3;-><init>(Lcom/android/settings/wifi/WifiSettings;Landroid/net/NetworkInfo$DetailedState;)V

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiSettings$3;->start()V

    goto :goto_0

    .line 679
    :cond_3
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mScanner:Lcom/android/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiSettings$Scanner;->resume()V

    goto :goto_1
.end method

.method private updateWifiState(I)V
    .locals 1
    .parameter "state"

    .prologue
    .line 791
    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 792
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mScanner:Lcom/android/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiSettings$Scanner;->resume()V

    .line 793
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->updateAccessPoints()V

    .line 798
    :goto_0
    return-void

    .line 795
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mScanner:Lcom/android/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 796
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    invoke-virtual {v0}, Lcom/android/settings/ProgressCategory;->removeAll()V

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 7
    .parameter "dialogInterface"
    .parameter "button"

    .prologue
    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 357
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    if-eqz v3, :cond_0

    .line 358
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget-object v4, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget-object v4, v4, Lcom/android/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/android/settings/wifi/WifiSettings;->isTrustedAP(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lcom/android/settings/wifi/AccessPoint;->isTrusted:Z

    .line 361
    :cond_0
    sget v3, Lcom/android/settings/wifi/WifiDialog;->BUTTON_DISCONNECT:I

    if-ne p2, v3, :cond_3

    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    if-eqz v3, :cond_3

    .line 362
    const-string v3, "WifiSettings"

    const-string v4, "disconnect ap"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    iget-boolean v3, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    if-eqz v3, :cond_2

    .line 364
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->disconnectAp()V

    .line 368
    :goto_0
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->noconnectAP()Z

    .line 433
    :cond_1
    :goto_1
    return-void

    .line 366
    :cond_2
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->disconnect()Z

    goto :goto_0

    .line 371
    :cond_3
    const/4 v3, -0x3

    if-ne p2, v3, :cond_4

    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    if-eqz v3, :cond_4

    .line 373
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v3, v3, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    if-eq v3, v6, :cond_1

    .line 374
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iput-boolean v5, v3, Lcom/android/settings/wifi/AccessPoint;->selectTrust:Z

    .line 375
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-direct {p0, v3}, Lcom/android/settings/wifi/WifiSettings;->sendUpdateTrustedApBroadcast(Lcom/android/settings/wifi/AccessPoint;)V

    .line 376
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    .line 377
    .local v1, info:Landroid/net/wifi/WifiInfo;
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v3, v3, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-direct {p0, v3}, Lcom/android/settings/wifi/WifiSettings;->forget(I)V

    .line 379
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget-object v4, v4, Lcom/android/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    .line 383
    .end local v1           #info:Landroid/net/wifi/WifiInfo;
    :cond_4
    sget v3, Lcom/android/settings/wifi/WifiDialog;->BUTTON_SUBMIT:I

    if-ne p2, v3, :cond_1

    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mDialog:Lcom/android/settings/wifi/WifiDialog;

    if-eqz v3, :cond_1

    .line 384
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mDialog:Lcom/android/settings/wifi/WifiDialog;

    invoke-virtual {v3}, Lcom/android/settings/wifi/WifiDialog;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v0

    .line 386
    .local v0, config:Landroid/net/wifi/WifiConfiguration;
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->allowconnectAP()Z

    .line 389
    if-nez v0, :cond_6

    .line 390
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-virtual {v3}, Lcom/android/settings/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/settings/wifi/WifiSettings;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 391
    iget-boolean v3, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    if-eqz v3, :cond_5

    .line 392
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v3, v3, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-direct {p0, v3}, Lcom/android/settings/wifi/WifiSettings;->manualconnect(I)V

    goto :goto_1

    .line 394
    :cond_5
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v3, v3, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-direct {p0, v3}, Lcom/android/settings/wifi/WifiSettings;->connect(I)V

    goto :goto_1

    .line 397
    :cond_6
    iget v3, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    if-eq v3, v6, :cond_9

    .line 399
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v3, v3, Lcom/android/settings/wifi/AccessPoint;->passworderror:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_8

    .line 400
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3, v0}, Landroid/net/wifi/WifiManager;->updateNetwork(Landroid/net/wifi/WifiConfiguration;)I

    .line 401
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->saveNetworks()V

    .line 402
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v4, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v4, v4, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-virtual {v3, v4, v5}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 403
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iput v5, v3, Lcom/android/settings/wifi/AccessPoint;->passworderror:I

    .line 404
    iget-boolean v3, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    if-eqz v3, :cond_7

    .line 405
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v3, v3, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-direct {p0, v3}, Lcom/android/settings/wifi/WifiSettings;->manualconnect(I)V

    goto/16 :goto_1

    .line 407
    :cond_7
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v3, v3, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-direct {p0, v3}, Lcom/android/settings/wifi/WifiSettings;->connect(I)V

    goto/16 :goto_1

    .line 412
    :cond_8
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    if-eqz v3, :cond_1

    .line 413
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3, v0}, Landroid/net/wifi/WifiManager;->updateNetwork(Landroid/net/wifi/WifiConfiguration;)I

    .line 414
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->saveNetworks()V

    goto/16 :goto_1

    .line 417
    :cond_9
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3, v0}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v2

    .line 418
    .local v2, networkId:I
    if-eq v2, v6, :cond_1

    .line 419
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v3, v2, v5}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 420
    iput v2, v0, Landroid/net/wifi/WifiConfiguration;->networkId:I

    .line 421
    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mDialog:Lcom/android/settings/wifi/WifiDialog;

    iget-boolean v3, v3, Lcom/android/settings/wifi/WifiDialog;->edit:Z

    if-nez v3, :cond_a

    invoke-direct {p0, v0}, Lcom/android/settings/wifi/WifiSettings;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 422
    :cond_a
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->saveNetworks()V

    goto/16 :goto_1

    .line 424
    :cond_b
    iget-boolean v3, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    if-eqz v3, :cond_c

    .line 425
    invoke-direct {p0, v2}, Lcom/android/settings/wifi/WifiSettings;->manualconnect(I)V

    goto/16 :goto_1

    .line 427
    :cond_c
    invoke-direct {p0, v2}, Lcom/android/settings/wifi/WifiSettings;->connect(I)V

    goto/16 :goto_1
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 7
    .parameter "item"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 264
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    if-nez v2, :cond_0

    .line 265
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    .line 309
    :goto_0
    return v2

    .line 267
    :cond_0
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    if-eqz v2, :cond_1

    .line 268
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget-object v3, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget-object v4, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget-object v4, v4, Lcom/android/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/android/settings/wifi/WifiSettings;->isTrustedAP(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, v3, Lcom/android/settings/wifi/AccessPoint;->isTrusted:Z

    iput-boolean v4, v2, Lcom/android/settings/wifi/AccessPoint;->selectTrust:Z

    .line 270
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 309
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    goto :goto_0

    .line 273
    :pswitch_0
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->allowconnectAP()Z

    .line 275
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_4

    .line 276
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-virtual {v2}, Lcom/android/settings/wifi/AccessPoint;->getConfig()Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/settings/wifi/WifiSettings;->requireKeyStore(Landroid/net/wifi/WifiConfiguration;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 277
    iget-boolean v2, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    if-eqz v2, :cond_3

    .line 278
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-direct {p0, v2}, Lcom/android/settings/wifi/WifiSettings;->manualconnect(I)V

    :cond_2
    :goto_1
    move v2, v6

    .line 298
    goto :goto_0

    .line 280
    :cond_3
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-direct {p0, v2}, Lcom/android/settings/wifi/WifiSettings;->connect(I)V

    goto :goto_1

    .line 283
    :cond_4
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/android/settings/wifi/AccessPoint;->security:I

    if-nez v2, :cond_6

    .line 285
    new-instance v0, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v0}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 286
    .local v0, config:Landroid/net/wifi/WifiConfiguration;
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget-object v2, v2, Lcom/android/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-static {v2}, Lcom/android/settings/wifi/AccessPoint;->convertToQuotedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 287
    iget-object v2, v0, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v2, v5}, Ljava/util/BitSet;->set(I)V

    .line 288
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2, v0}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v1

    .line 289
    .local v1, networkId:I
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2, v1, v5}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 290
    iget-boolean v2, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    if-eqz v2, :cond_5

    .line 291
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-direct {p0, v2}, Lcom/android/settings/wifi/WifiSettings;->manualconnect(I)V

    goto :goto_1

    .line 293
    :cond_5
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-direct {p0, v2}, Lcom/android/settings/wifi/WifiSettings;->connect(I)V

    goto :goto_1

    .line 296
    .end local v0           #config:Landroid/net/wifi/WifiConfiguration;
    .end local v1           #networkId:I
    :cond_6
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-direct {p0, v2, v5}, Lcom/android/settings/wifi/WifiSettings;->showDialog(Lcom/android/settings/wifi/AccessPoint;Z)V

    goto :goto_1

    .line 301
    :pswitch_1
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iput-boolean v5, v2, Lcom/android/settings/wifi/AccessPoint;->selectTrust:Z

    .line 302
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-direct {p0, v2}, Lcom/android/settings/wifi/WifiSettings;->sendUpdateTrustedApBroadcast(Lcom/android/settings/wifi/AccessPoint;)V

    .line 303
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v2, v2, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    invoke-direct {p0, v2}, Lcom/android/settings/wifi/WifiSettings;->forget(I)V

    move v2, v6

    .line 304
    goto/16 :goto_0

    .line 306
    :pswitch_2
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-direct {p0, v2, v6}, Lcom/android/settings/wifi/WifiSettings;->showDialog(Lcom/android/settings/wifi/AccessPoint;Z)V

    move v2, v6

    .line 307
    goto/16 :goto_0

    .line 270
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const-string v6, "wifi_auto_connect"

    .line 131
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 133
    const-string v1, "ro.device.support.cmccwifi"

    invoke-static {v1, v5}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    .line 135
    const-string v1, "wifi"

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    iput-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 137
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    iput-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mConnectivityManager:Landroid/net/ConnectivityManager;

    .line 139
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "only_access_points"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 140
    const v1, 0x7f040033

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->addPreferencesFromResource(I)V

    .line 165
    :goto_0
    const-string v1, "access_points"

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Lcom/android/settings/ProgressCategory;

    iput-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    .line 167
    const-string v1, "trusted_ap_list"

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mTrustList:Landroid/preference/Preference;

    .line 168
    sget-object v1, Lcom/android/settings/wifi/WifiSettings;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 169
    :try_start_0
    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/settings/ProgressCategory;->setOrderingAsAdded(Z)V

    .line 170
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    const-string v1, "add_network"

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mAddNetwork:Landroid/preference/Preference;

    .line 173
    iget-boolean v1, p0, Lcom/android/settings/wifi/WifiSettings;->supportCMCC:Z

    if-eqz v1, :cond_6

    .line 179
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->registerForContextMenu(Landroid/view/View;)V

    .line 180
    return-void

    .line 142
    :cond_1
    const v1, 0x7f040036

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->addPreferencesFromResource(I)V

    .line 143
    new-instance v2, Lcom/android/settings/wifi/WifiEnabler;

    const-string v1, "enable_wifi"

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    invoke-direct {v2, p0, v1}, Lcom/android/settings/wifi/WifiEnabler;-><init>(Landroid/content/Context;Landroid/preference/CheckBoxPreference;)V

    iput-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/android/settings/wifi/WifiEnabler;

    .line 147
    const-string v1, "auto_connect"

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    iput-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mAutoConnect:Landroid/preference/CheckBoxPreference;

    .line 148
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "wifi_auto_connect"

    invoke-static {v1, v6}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 149
    .local v0, autoFlag:Ljava/lang/String;
    const-string v1, "0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 150
    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mAutoConnect:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 151
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "wifi_auto_connect"

    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mAutoConnect:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_2

    move v2, v5

    :goto_2
    invoke-static {v1, v6, v2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 159
    :goto_3
    const-string v1, "notify_open_networks"

    invoke-virtual {p0, v1}, Lcom/android/settings/wifi/WifiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    iput-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mNotifyOpenNetworks:Landroid/preference/CheckBoxPreference;

    .line 161
    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mNotifyOpenNetworks:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "wifi_networks_available_notification_on"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v5, :cond_5

    move v2, v5

    :goto_4
    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto/16 :goto_0

    :cond_2
    move v2, v4

    .line 151
    goto :goto_2

    .line 155
    :cond_3
    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mAutoConnect:Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "wifi_auto_connect"

    invoke-static {v2, v6, v4}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v5, :cond_4

    move v2, v5

    :goto_5
    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_3

    :cond_4
    move v2, v4

    goto :goto_5

    :cond_5
    move v2, v4

    .line 161
    goto :goto_4

    .line 170
    .end local v0           #autoFlag:Ljava/lang/String;
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 176
    :cond_6
    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mAutoConnect:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_7

    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mAutoConnect:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 177
    :cond_7
    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mTrustList:Landroid/preference/Preference;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mTrustList:Landroid/preference/Preference;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto/16 :goto_1
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 5
    .parameter "menu"
    .parameter "view"
    .parameter "info"

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 241
    instance-of v1, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    if-eqz v1, :cond_1

    .line 242
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getListView()Landroid/widget/ListView;

    move-result-object v1

    check-cast p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .end local p3
    iget v2, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/Preference;

    .line 245
    .local v0, preference:Landroid/preference/Preference;
    instance-of v1, v0, Lcom/android/settings/wifi/AccessPoint;

    if-eqz v1, :cond_1

    .line 246
    check-cast v0, Lcom/android/settings/wifi/AccessPoint;

    .end local v0           #preference:Landroid/preference/Preference;
    iput-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    .line 247
    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget-object v1, v1, Lcom/android/settings/wifi/AccessPoint;->ssid:Ljava/lang/String;

    invoke-interface {p1, v1}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 248
    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/android/settings/wifi/AccessPoint;->getLevel()I

    move-result v1

    if-eq v1, v4, :cond_0

    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-virtual {v1}, Lcom/android/settings/wifi/AccessPoint;->getState()Landroid/net/NetworkInfo$DetailedState;

    move-result-object v1

    if-nez v1, :cond_0

    .line 249
    const/4 v1, 0x3

    const v2, 0x7f08016f

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 251
    :cond_0
    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/android/settings/wifi/AccessPoint;->networkId:I

    if-eq v1, v4, :cond_1

    .line 253
    const/4 v1, 0x4

    const v2, 0x7f080170

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 254
    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    iget v1, v1, Lcom/android/settings/wifi/AccessPoint;->security:I

    if-eqz v1, :cond_1

    .line 255
    const/4 v1, 0x5

    const v2, 0x7f080171

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 260
    :cond_1
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .parameter "menu"

    .prologue
    const/4 v2, 0x0

    .line 214
    const/4 v0, 0x1

    const v1, 0x7f08016d

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020036

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 216
    const/4 v0, 0x2

    const v1, 0x7f08016e

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080042

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 218
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x1

    .line 223
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 236
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 225
    :pswitch_0
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 226
    sget-object v0, Lcom/android/settings/wifi/WifiSettings;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 227
    :try_start_0
    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mAccessPoints:Lcom/android/settings/ProgressCategory;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/settings/ProgressCategory;->setProgress(Z)V

    .line 228
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 229
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mScanner:Lcom/android/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiSettings$Scanner;->resume()V

    :cond_0
    move v0, v3

    .line 231
    goto :goto_0

    .line 228
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 233
    :pswitch_1
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/settings/wifi/AdvancedSettings;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/android/settings/wifi/WifiSettings;->startActivity(Landroid/content/Intent;)V

    move v0, v3

    .line 234
    goto :goto_0

    .line 223
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 197
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 198
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/android/settings/wifi/WifiEnabler;

    if-eqz v0, :cond_0

    .line 199
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/android/settings/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiEnabler;->pause()V

    .line 201
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/settings/wifi/WifiSettings;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 202
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mScanner:Lcom/android/settings/wifi/WifiSettings$Scanner;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiSettings$Scanner;->pause()V

    .line 203
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mDialog:Lcom/android/settings/wifi/WifiDialog;

    if-eqz v0, :cond_1

    .line 204
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mDialog:Lcom/android/settings/wifi/WifiDialog;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiDialog;->dismiss()V

    .line 205
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mDialog:Lcom/android/settings/wifi/WifiDialog;

    .line 207
    :cond_1
    iget-boolean v0, p0, Lcom/android/settings/wifi/WifiSettings;->mResetNetworks:Z

    if-eqz v0, :cond_2

    .line 208
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->enableNetworks()V

    .line 210
    :cond_2
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .parameter
    .parameter

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 315
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mAutoConnect:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_1

    .line 316
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mAutoConnect:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager;->setAutoConnect(Z)Z

    .line 317
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "wifi_auto_connect"

    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mAutoConnect:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v3

    :goto_0
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    :goto_1
    move v0, v3

    .line 352
    :goto_2
    return v0

    :cond_0
    move v2, v4

    .line 317
    goto :goto_0

    .line 321
    :cond_1
    instance-of v0, p2, Lcom/android/settings/wifi/AccessPoint;

    if-eqz v0, :cond_2

    .line 322
    check-cast p2, Lcom/android/settings/wifi/AccessPoint;

    iput-object p2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    .line 323
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    invoke-direct {p0, v0, v4}, Lcom/android/settings/wifi/WifiSettings;->showDialog(Lcom/android/settings/wifi/AccessPoint;Z)V

    goto :goto_1

    .line 324
    :cond_2
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mAddNetwork:Landroid/preference/Preference;

    if-ne p2, v0, :cond_3

    .line 325
    iput-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mSelected:Lcom/android/settings/wifi/AccessPoint;

    .line 326
    invoke-direct {p0, v2, v3}, Lcom/android/settings/wifi/WifiSettings;->showDialog(Lcom/android/settings/wifi/AccessPoint;Z)V

    goto :goto_1

    .line 327
    :cond_3
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mNotifyOpenNetworks:Landroid/preference/CheckBoxPreference;

    if-ne p2, v0, :cond_5

    .line 328
    invoke-virtual {p0}, Lcom/android/settings/wifi/WifiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "wifi_networks_available_notification_on"

    iget-object v2, p0, Lcom/android/settings/wifi/WifiSettings;->mNotifyOpenNetworks:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_4

    move v2, v3

    :goto_3
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_1

    :cond_4
    move v2, v4

    goto :goto_3

    .line 333
    :cond_5
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mTrustList:Landroid/preference/Preference;

    if-ne p2, v0, :cond_7

    .line 335
    invoke-direct {p0}, Lcom/android/settings/wifi/WifiSettings;->getListData()[Ljava/lang/String;

    move-result-object v0

    .line 336
    array-length v0, v0

    .line 337
    if-nez v0, :cond_6

    .line 338
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f08053f

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0805a9

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    .line 345
    :cond_6
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/settings/wifi/WifiTrustedAPList;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 346
    invoke-virtual {p0, v0}, Lcom/android/settings/wifi/WifiSettings;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 350
    :cond_7
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    goto :goto_2
.end method

.method protected onResume()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 184
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 185
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/android/settings/wifi/WifiEnabler;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mWifiEnabler:Lcom/android/settings/wifi/WifiEnabler;

    invoke-virtual {v0}, Lcom/android/settings/wifi/WifiEnabler;->resume()V

    .line 188
    :cond_0
    iget-object v0, p0, Lcom/android/settings/wifi/WifiSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/android/settings/wifi/WifiSettings;->mFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/android/settings/wifi/WifiSettings;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 189
    iget v0, p0, Lcom/android/settings/wifi/WifiSettings;->mKeyStoreNetworkId:I

    if-eq v0, v2, :cond_1

    invoke-static {}, Landroid/security/KeyStore;->getInstance()Landroid/security/KeyStore;

    move-result-object v0

    invoke-virtual {v0}, Landroid/security/KeyStore;->test()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 190
    iget v0, p0, Lcom/android/settings/wifi/WifiSettings;->mKeyStoreNetworkId:I

    invoke-direct {p0, v0}, Lcom/android/settings/wifi/WifiSettings;->connect(I)V

    .line 192
    :cond_1
    iput v2, p0, Lcom/android/settings/wifi/WifiSettings;->mKeyStoreNetworkId:I

    .line 193
    return-void
.end method
