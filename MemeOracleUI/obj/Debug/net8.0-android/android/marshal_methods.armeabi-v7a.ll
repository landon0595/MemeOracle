; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [335 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [664 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 20765420, ; 3: Tensorflow.Binding.dll => 0x13cdaec => 211
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 253
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 287
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 200
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 57754410, ; 10: Reddit.NET.dll => 0x371432a => 204
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 328
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 191
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 16: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 271
	i32 117431740, ; 17: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 18: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 271
	i32 122350210, ; 19: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 123542112, ; 20: OneOf => 0x75d1a60 => 201
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 291
	i32 142721839, ; 22: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 23: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 24: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 25: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 227
	i32 176265551, ; 26: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 27: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 273
	i32 184328833, ; 28: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 29: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 325
	i32 199333315, ; 30: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 326
	i32 205061960, ; 31: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 32: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 225
	i32 220171995, ; 33: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 34: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 247
	i32 230752869, ; 35: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 36: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 37: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 38: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 39: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 230
	i32 266296289, ; 40: MethodBoundaryAspect.dll => 0xfdf5be1 => 176
	i32 276479776, ; 41: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 42: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 249
	i32 280482487, ; 43: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 246
	i32 280992041, ; 44: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 297
	i32 291076382, ; 45: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 297949789, ; 46: MethodBoundaryAspect => 0x11c25a5d => 176
	i32 298918909, ; 47: System.Net.Ping.dll => 0x11d123fd => 69
	i32 305710573, ; 48: Microsoft.ML.CpuMath.dll => 0x1238c5ed => 198
	i32 313919069, ; 49: MemeOracleUI.dll => 0x12b6065d => 0
	i32 317674968, ; 50: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 325
	i32 318968648, ; 51: Xamarin.AndroidX.Activity.dll => 0x13031348 => 216
	i32 321597661, ; 52: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 53: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 310
	i32 342366114, ; 54: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 248
	i32 356389973, ; 55: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 309
	i32 360082299, ; 56: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 57: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 58: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 59: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 60: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 61: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 62: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 63: _Microsoft.Android.Resource.Designer => 0x17969339 => 331
	i32 398680804, ; 64: Serilog.Sinks.Console => 0x17c362e4 => 207
	i32 403441872, ; 65: WindowsBase => 0x180c08d0 => 165
	i32 413314040, ; 66: Sprache => 0x18a2abf8 => 208
	i32 435591531, ; 67: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 321
	i32 441335492, ; 68: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 231
	i32 442565967, ; 69: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 70: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 244
	i32 451504562, ; 71: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 72: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 73: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 74: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 75: System.dll => 0x1bff388e => 164
	i32 476646585, ; 76: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 246
	i32 486930444, ; 77: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 259
	i32 498788369, ; 78: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 79: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 308
	i32 503918385, ; 80: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 302
	i32 513247710, ; 81: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 185
	i32 526420162, ; 82: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 83: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 291
	i32 530272170, ; 84: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 85: Microsoft.Extensions.Logging => 0x20216150 => 181
	i32 540030774, ; 86: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 87: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 88: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 89: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 90: Jsr305Binding => 0x213954e7 => 284
	i32 569601784, ; 91: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 282
	i32 577335427, ; 92: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 93: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 316
	i32 601371474, ; 94: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 95: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 96: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 622817381, ; 97: System.Numerics.Tensors => 0x251f7065 => 210
	i32 627609679, ; 98: Xamarin.AndroidX.CustomView => 0x2568904f => 236
	i32 627931235, ; 99: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 314
	i32 639843206, ; 100: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 242
	i32 643868501, ; 101: System.Net => 0x2660a755 => 81
	i32 662205335, ; 102: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 103: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 278
	i32 666292255, ; 104: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 223
	i32 672442732, ; 105: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 106: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 107: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 296
	i32 690569205, ; 108: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 109: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 293
	i32 693804605, ; 110: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 111: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 112: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 288
	i32 700358131, ; 113: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 114: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 311
	i32 709557578, ; 115: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 299
	i32 720511267, ; 116: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 292
	i32 722857257, ; 117: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 118: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 119: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 120: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 213
	i32 759454413, ; 121: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 122: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 123: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 124: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 320
	i32 789151979, ; 125: Microsoft.Extensions.Options => 0x2f0980eb => 184
	i32 790371945, ; 126: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 237
	i32 804715423, ; 127: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 128: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 251
	i32 812630446, ; 129: Serilog => 0x306fc1ae => 206
	i32 823281589, ; 130: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 131: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 132: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 133: System.Net.Quic => 0x31b69d60 => 71
	i32 839436655, ; 134: DotNetEnv => 0x3208c96f => 173
	i32 843511501, ; 135: Xamarin.AndroidX.Print => 0x3246f6cd => 264
	i32 848419076, ; 136: Microsoft.ML.DataView => 0x3291d904 => 199
	i32 857381194, ; 137: MemeFinder => 0x331a994a => 329
	i32 873119928, ; 138: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 139: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 140: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 141: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 142: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 143: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 323
	i32 928116545, ; 144: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 287
	i32 933403136, ; 145: Microsoft.ML.KMeansClustering => 0x37a29a00 => 194
	i32 952186615, ; 146: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 147: Newtonsoft.Json => 0x38f24a24 => 200
	i32 956575887, ; 148: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 292
	i32 966729478, ; 149: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 285
	i32 967690846, ; 150: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 248
	i32 975236339, ; 151: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 152: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 153: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 154: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 155: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 156: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 157: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 158: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 268
	i32 1019214401, ; 159: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 160: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 180
	i32 1029334545, ; 161: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 298
	i32 1031528504, ; 162: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 286
	i32 1035644815, ; 163: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 221
	i32 1036536393, ; 164: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 165: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 166: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 255
	i32 1059849049, ; 167: Sprache.dll => 0x3f2c0359 => 208
	i32 1064460183, ; 168: Razorvine.Pickle.dll => 0x3f725f97 => 203
	i32 1067306892, ; 169: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 170: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 171: Xamarin.Kotlin.StdLib => 0x409e66d8 => 289
	i32 1098259244, ; 172: System => 0x41761b2c => 164
	i32 1118262833, ; 173: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 311
	i32 1121599056, ; 174: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 254
	i32 1127624469, ; 175: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 183
	i32 1149092582, ; 176: Xamarin.AndroidX.Window => 0x447dc2e6 => 281
	i32 1168523401, ; 177: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 317
	i32 1170634674, ; 178: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 179: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 277
	i32 1178241025, ; 180: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 262
	i32 1199680934, ; 181: Microsoft.ML.PCA.dll => 0x4781ada6 => 195
	i32 1203215381, ; 182: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 315
	i32 1204270330, ; 183: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 223
	i32 1205030129, ; 184: Reddit.NET => 0x47d34cf1 => 204
	i32 1208641965, ; 185: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 186: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 187: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 313
	i32 1243150071, ; 188: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 282
	i32 1253011324, ; 189: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 190: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 297
	i32 1264511973, ; 191: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 272
	i32 1267360935, ; 192: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 276
	i32 1273260888, ; 193: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 228
	i32 1275534314, ; 194: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 293
	i32 1278448581, ; 195: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 220
	i32 1293217323, ; 196: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 239
	i32 1309188875, ; 197: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 198: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 281
	i32 1324164729, ; 199: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 200: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 201: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 202: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 327
	i32 1376866003, ; 203: Xamarin.AndroidX.SavedState => 0x52114ed3 => 268
	i32 1379779777, ; 204: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 205: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 206: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 232
	i32 1408764838, ; 207: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 208: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 209: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 210: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 295
	i32 1434145427, ; 211: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 212: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 285
	i32 1439761251, ; 213: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1445117038, ; 214: Microsoft.ML.StandardTrainers => 0x5622bc6e => 196
	i32 1452070440, ; 215: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 216: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 217: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 218: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 219: es\Microsoft.Maui.Controls.resources => 0x57152abe => 301
	i32 1461234159, ; 220: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 221: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 222: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 223: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 222
	i32 1470490898, ; 224: Microsoft.Extensions.Primitives => 0x57a5e912 => 185
	i32 1472315147, ; 225: Microsoft.ML.KMeansClustering.dll => 0x57c1bf0b => 194
	i32 1479771757, ; 226: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 227: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 228: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 229: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 269
	i32 1493001747, ; 230: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 305
	i32 1514721132, ; 231: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 300
	i32 1530007743, ; 232: MemeOracle_SharedLibrary => 0x5b3210bf => 330
	i32 1536373174, ; 233: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 234: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 235: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 236: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 237: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 320
	i32 1555438164, ; 238: Microsoft.ML.StandardTrainers.dll => 0x5cb61a54 => 196
	i32 1565862583, ; 239: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 240: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 241: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 242: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 243: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 238
	i32 1592978981, ; 244: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 245: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 286
	i32 1601112923, ; 246: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 247: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 248: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 249: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 258
	i32 1622358360, ; 250: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 251: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 280
	i32 1625558452, ; 252: Serilog.dll => 0x60e40db4 => 206
	i32 1635184631, ; 253: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 242
	i32 1636350590, ; 254: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 235
	i32 1639515021, ; 255: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 256: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 257: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 258: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 259: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 274
	i32 1658251792, ; 260: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 283
	i32 1670060433, ; 261: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 230
	i32 1675553242, ; 262: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 263: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 264: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 265: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 266: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 267: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 268: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 290
	i32 1701541528, ; 269: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 270: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 251
	i32 1726116996, ; 271: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 272: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1728929640, ; 273: Microsoft.ML.Data.dll => 0x670d5f68 => 193
	i32 1729485958, ; 274: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 226
	i32 1736233607, ; 275: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 318
	i32 1743415430, ; 276: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 296
	i32 1744735666, ; 277: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 278: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 279: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 280: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 281: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 282: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 283: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 273
	i32 1770582343, ; 284: Microsoft.Extensions.Logging.dll => 0x6988f147 => 181
	i32 1776026572, ; 285: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 286: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 287: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 288: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 312
	i32 1788241197, ; 289: Xamarin.AndroidX.Fragment => 0x6a96652d => 244
	i32 1793755602, ; 290: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 304
	i32 1808609942, ; 291: Xamarin.AndroidX.Loader => 0x6bcd3296 => 258
	i32 1813058853, ; 292: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 289
	i32 1813201214, ; 293: Xamarin.Google.Android.Material => 0x6c13413e => 283
	i32 1818569960, ; 294: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 263
	i32 1818787751, ; 295: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 296: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 297: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 298: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 182
	i32 1842015223, ; 299: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 324
	i32 1847515442, ; 300: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 213
	i32 1853025655, ; 301: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 321
	i32 1858542181, ; 302: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 303: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 304: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 303
	i32 1879696579, ; 305: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 306: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 224
	i32 1888955245, ; 307: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 308: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 309: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 310: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 311: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1927897671, ; 312: System.CodeDom.dll => 0x72e96247 => 209
	i32 1939592360, ; 313: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 314: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 315: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 270
	i32 1968388702, ; 316: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 177
	i32 1983156543, ; 317: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 290
	i32 1985761444, ; 318: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 215
	i32 2003115576, ; 319: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 300
	i32 2011961780, ; 320: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 321: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 255
	i32 2025202353, ; 322: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 295
	i32 2031763787, ; 323: Xamarin.Android.Glide => 0x791a414b => 212
	i32 2045470958, ; 324: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 325: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 250
	i32 2060060697, ; 326: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 327: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 299
	i32 2070888862, ; 328: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 329: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 330: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2094405699, ; 331: System.Numerics.Tensors.dll => 0x7cd61843 => 210
	i32 2127167465, ; 332: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 333: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 334: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 335: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 336: Microsoft.Maui => 0x80bd55ad => 189
	i32 2169148018, ; 337: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 307
	i32 2171397733, ; 338: Serilog.Sinks.Console.dll => 0x816ce665 => 207
	i32 2178612968, ; 339: System.CodeDom => 0x81dafee8 => 209
	i32 2181898931, ; 340: Microsoft.Extensions.Options.dll => 0x820d22b3 => 184
	i32 2192057212, ; 341: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 182
	i32 2193016926, ; 342: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 343: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 294
	i32 2201231467, ; 344: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 345: it\Microsoft.Maui.Controls.resources => 0x839595db => 309
	i32 2217644978, ; 346: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 277
	i32 2222056684, ; 347: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 348: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 259
	i32 2252106437, ; 349: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 350: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2262067697, ; 351: Razorvine.Pickle => 0x86d469f1 => 203
	i32 2265110946, ; 352: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 353: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 178
	i32 2267693617, ; 354: Microsoft.ML.Transforms.dll => 0x872a4231 => 197
	i32 2267999099, ; 355: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 214
	i32 2270573516, ; 356: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 303
	i32 2276592402, ; 357: Microsoft.ML.Core => 0x87b20b12 => 192
	i32 2279755925, ; 358: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 266
	i32 2280430125, ; 359: Microsoft.ML.Transforms => 0x87ec9a2d => 197
	i32 2293034957, ; 360: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 361: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 362: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 363: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 313
	i32 2305521784, ; 364: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 365: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 218
	i32 2320631194, ; 366: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 367: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 368: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2352699283, ; 369: DotNetEnv.dll => 0x8c3b5793 => 173
	i32 2353062107, ; 370: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 371: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 372: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 177
	i32 2378619854, ; 373: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 374: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 375: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 308
	i32 2396085415, ; 376: Protobuf.Text.dll => 0x8ed15ca7 => 202
	i32 2401565422, ; 377: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 378: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 241
	i32 2421380589, ; 379: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 380: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 228
	i32 2427813419, ; 381: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 305
	i32 2435356389, ; 382: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 383: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 384: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 385: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 386: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 387: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 231
	i32 2471841756, ; 388: netstandard.dll => 0x93554fdc => 167
	i32 2473157462, ; 389: Microsoft.ML.CpuMath => 0x93696356 => 198
	i32 2475788418, ; 390: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 391: Microsoft.Maui.Controls => 0x93dba8a1 => 187
	i32 2483903535, ; 392: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 393: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 394: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 395: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 396: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 253
	i32 2511882562, ; 397: OneOf.dll => 0x95b84942 => 201
	i32 2522472828, ; 398: Xamarin.Android.Glide.dll => 0x9659e17c => 212
	i32 2538310050, ; 399: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2545100931, ; 400: MemeOracle_SharedLibrary.dll => 0x97b32883 => 330
	i32 2549538471, ; 401: Microsoft.ML.Core.dll => 0x97f6dea7 => 192
	i32 2550873716, ; 402: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 306
	i32 2562349572, ; 403: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 404: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 405: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 254
	i32 2581819634, ; 406: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 276
	i32 2585220780, ; 407: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 408: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 409: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 410: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 315
	i32 2605712449, ; 411: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 294
	i32 2615233544, ; 412: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 245
	i32 2616218305, ; 413: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 183
	i32 2617129537, ; 414: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 415: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 416: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 235
	i32 2624644809, ; 417: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 240
	i32 2626831493, ; 418: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 310
	i32 2627185994, ; 419: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 420: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 421: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 249
	i32 2643034788, ; 422: Microsoft.ML.Data => 0x9d8982a4 => 193
	i32 2663391936, ; 423: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 214
	i32 2663698177, ; 424: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 425: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 426: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 427: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 428: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 429: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 430: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 274
	i32 2715334215, ; 431: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 432: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 433: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 434: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 435: Xamarin.AndroidX.Activity => 0xa2e0939b => 216
	i32 2735172069, ; 436: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 437: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 222
	i32 2740948882, ; 438: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2743847202, ; 439: Tensorflow.Binding => 0xa38bc922 => 211
	i32 2748088231, ; 440: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 441: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 316
	i32 2758225723, ; 442: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 188
	i32 2764765095, ; 443: Microsoft.Maui.dll => 0xa4caf7a7 => 189
	i32 2765824710, ; 444: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 445: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 288
	i32 2778768386, ; 446: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 279
	i32 2779977773, ; 447: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 267
	i32 2785988530, ; 448: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 322
	i32 2788224221, ; 449: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 245
	i32 2801831435, ; 450: Microsoft.Maui.Graphics => 0xa7008e0b => 191
	i32 2803228030, ; 451: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 452: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 301
	i32 2810250172, ; 453: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 232
	i32 2819470561, ; 454: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 455: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 456: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 267
	i32 2824502124, ; 457: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 458: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 314
	i32 2838993487, ; 459: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 256
	i32 2849599387, ; 460: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 461: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 279
	i32 2855708567, ; 462: Xamarin.AndroidX.Transition => 0xaa36a797 => 275
	i32 2861098320, ; 463: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 464: Microsoft.Maui.Essentials => 0xaa8a4878 => 190
	i32 2866471860, ; 465: Protobuf.Text => 0xaadae3b4 => 202
	i32 2870099610, ; 466: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 217
	i32 2875164099, ; 467: Jsr305Binding.dll => 0xab5f85c3 => 284
	i32 2875220617, ; 468: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 469: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 243
	i32 2887636118, ; 470: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 471: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 472: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 473: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 474: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 475: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 476: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 280
	i32 2919462931, ; 477: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 478: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 219
	i32 2936416060, ; 479: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 480: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 481: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 482: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 483: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 484: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 485: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 239
	i32 2987532451, ; 486: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 270
	i32 2996846495, ; 487: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 252
	i32 3016983068, ; 488: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 272
	i32 3023353419, ; 489: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 490: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 247
	i32 3038032645, ; 491: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 331
	i32 3056245963, ; 492: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 269
	i32 3057625584, ; 493: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 260
	i32 3059408633, ; 494: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 495: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 496: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 497: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 307
	i32 3090735792, ; 498: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 499: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 500: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 501: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 502: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 503: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 504: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 505: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 506: GoogleGson.dll => 0xbba64c02 => 175
	i32 3159123045, ; 507: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 508: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 509: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 261
	i32 3192346100, ; 510: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 511: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 512: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 513: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 514: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 238
	i32 3220365878, ; 515: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 516: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3249260365, ; 517: RestSharp.dll => 0xc1abc74d => 205
	i32 3251039220, ; 518: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3257797210, ; 519: MemeFinder.dll => 0xc22e0a5a => 329
	i32 3258312781, ; 520: Xamarin.AndroidX.CardView => 0xc235e84d => 226
	i32 3265493905, ; 521: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 522: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 523: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 524: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 525: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 526: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 527: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 528: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 529: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 302
	i32 3316684772, ; 530: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 531: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 236
	i32 3317144872, ; 532: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 533: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 224
	i32 3345895724, ; 534: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 265
	i32 3346324047, ; 535: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 262
	i32 3357674450, ; 536: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 319
	i32 3358260929, ; 537: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 538: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 217
	i32 3362522851, ; 539: Xamarin.AndroidX.Core => 0xc86c06e3 => 233
	i32 3366347497, ; 540: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 541: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 266
	i32 3381016424, ; 542: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 298
	i32 3395150330, ; 543: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 544: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 545: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 237
	i32 3428513518, ; 546: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 179
	i32 3429136800, ; 547: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 548: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 549: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 240
	i32 3445260447, ; 550: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 551: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 186
	i32 3463511458, ; 552: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 306
	i32 3471940407, ; 553: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 554: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 555: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 319
	i32 3484440000, ; 556: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 318
	i32 3485117614, ; 557: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 558: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 559: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 229
	i32 3499097210, ; 560: Google.Protobuf.dll => 0xd08ffc7a => 174
	i32 3509114376, ; 561: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 562: System.Security.dll => 0xd1854eb4 => 130
	i32 3522696746, ; 563: Microsoft.ML.PCA => 0xd1f8162a => 195
	i32 3530912306, ; 564: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 565: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 566: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 567: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 568: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 326
	i32 3597029428, ; 569: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 215
	i32 3598340787, ; 570: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 571: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 572: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 573: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 264
	i32 3633644679, ; 574: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 219
	i32 3638274909, ; 575: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 576: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 250
	i32 3643446276, ; 577: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 323
	i32 3643854240, ; 578: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 261
	i32 3645089577, ; 579: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3645630983, ; 580: Google.Protobuf => 0xd94bea07 => 174
	i32 3657292374, ; 581: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 178
	i32 3660523487, ; 582: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 583: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 584: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 225
	i32 3684561358, ; 585: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 229
	i32 3697841164, ; 586: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 328
	i32 3700866549, ; 587: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 588: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 234
	i32 3711244101, ; 589: Microsoft.ML.DataView.dll => 0xdd351745 => 199
	i32 3716563718, ; 590: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 591: Xamarin.AndroidX.Annotation => 0xdda814c6 => 218
	i32 3724971120, ; 592: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 260
	i32 3732100267, ; 593: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 594: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 595: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 596: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 597: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 227
	i32 3792276235, ; 598: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 599: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 186
	i32 3802395368, ; 600: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3816437471, ; 601: RestSharp => 0xe37a36df => 205
	i32 3819260425, ; 602: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 603: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 604: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 605: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 180
	i32 3844307129, ; 606: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 607: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 608: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 609: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 610: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 611: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 612: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 275
	i32 3888767677, ; 613: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 265
	i32 3889960447, ; 614: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 327
	i32 3896106733, ; 615: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 616: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 233
	i32 3901907137, ; 617: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 618: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 619: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 278
	i32 3928044579, ; 620: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 621: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 622: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 263
	i32 3945713374, ; 623: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 624: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 625: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 221
	i32 3959773229, ; 626: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 252
	i32 3980434154, ; 627: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 322
	i32 3987592930, ; 628: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 304
	i32 4003436829, ; 629: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 630: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 220
	i32 4025784931, ; 631: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 632: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 188
	i32 4054681211, ; 633: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 634: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 635: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 636: Microsoft.Maui.Essentials.dll => 0xf40add04 => 190
	i32 4099507663, ; 637: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 638: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 639: Xamarin.AndroidX.Emoji2 => 0xf479582c => 241
	i32 4102112229, ; 640: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 317
	i32 4125707920, ; 641: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 312
	i32 4126470640, ; 642: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 179
	i32 4127667938, ; 643: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 644: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 645: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 646: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 324
	i32 4151237749, ; 647: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 648: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 649: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 650: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 651: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 652: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 257
	i32 4185676441, ; 653: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 654: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 655: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 656: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 234
	i32 4258378803, ; 657: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 256
	i32 4260525087, ; 658: System.Buffers => 0xfdf2741f => 7
	i32 4263348244, ; 659: MemeOracleUI => 0xfe1d8814 => 0
	i32 4271975918, ; 660: Microsoft.Maui.Controls.dll => 0xfea12dee => 187
	i32 4274976490, ; 661: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 662: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 257
	i32 4294763496 ; 663: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 243
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [664 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 211, ; 3
	i32 253, ; 4
	i32 287, ; 5
	i32 48, ; 6
	i32 200, ; 7
	i32 80, ; 8
	i32 145, ; 9
	i32 204, ; 10
	i32 30, ; 11
	i32 328, ; 12
	i32 124, ; 13
	i32 191, ; 14
	i32 102, ; 15
	i32 271, ; 16
	i32 107, ; 17
	i32 271, ; 18
	i32 139, ; 19
	i32 201, ; 20
	i32 291, ; 21
	i32 77, ; 22
	i32 124, ; 23
	i32 13, ; 24
	i32 227, ; 25
	i32 132, ; 26
	i32 273, ; 27
	i32 151, ; 28
	i32 325, ; 29
	i32 326, ; 30
	i32 18, ; 31
	i32 225, ; 32
	i32 26, ; 33
	i32 247, ; 34
	i32 1, ; 35
	i32 59, ; 36
	i32 42, ; 37
	i32 91, ; 38
	i32 230, ; 39
	i32 176, ; 40
	i32 147, ; 41
	i32 249, ; 42
	i32 246, ; 43
	i32 297, ; 44
	i32 54, ; 45
	i32 176, ; 46
	i32 69, ; 47
	i32 198, ; 48
	i32 0, ; 49
	i32 325, ; 50
	i32 216, ; 51
	i32 83, ; 52
	i32 310, ; 53
	i32 248, ; 54
	i32 309, ; 55
	i32 131, ; 56
	i32 55, ; 57
	i32 149, ; 58
	i32 74, ; 59
	i32 145, ; 60
	i32 62, ; 61
	i32 146, ; 62
	i32 331, ; 63
	i32 207, ; 64
	i32 165, ; 65
	i32 208, ; 66
	i32 321, ; 67
	i32 231, ; 68
	i32 12, ; 69
	i32 244, ; 70
	i32 125, ; 71
	i32 152, ; 72
	i32 113, ; 73
	i32 166, ; 74
	i32 164, ; 75
	i32 246, ; 76
	i32 259, ; 77
	i32 84, ; 78
	i32 308, ; 79
	i32 302, ; 80
	i32 185, ; 81
	i32 150, ; 82
	i32 291, ; 83
	i32 60, ; 84
	i32 181, ; 85
	i32 51, ; 86
	i32 103, ; 87
	i32 114, ; 88
	i32 40, ; 89
	i32 284, ; 90
	i32 282, ; 91
	i32 120, ; 92
	i32 316, ; 93
	i32 52, ; 94
	i32 44, ; 95
	i32 119, ; 96
	i32 210, ; 97
	i32 236, ; 98
	i32 314, ; 99
	i32 242, ; 100
	i32 81, ; 101
	i32 136, ; 102
	i32 278, ; 103
	i32 223, ; 104
	i32 8, ; 105
	i32 73, ; 106
	i32 296, ; 107
	i32 155, ; 108
	i32 293, ; 109
	i32 154, ; 110
	i32 92, ; 111
	i32 288, ; 112
	i32 45, ; 113
	i32 311, ; 114
	i32 299, ; 115
	i32 292, ; 116
	i32 109, ; 117
	i32 129, ; 118
	i32 25, ; 119
	i32 213, ; 120
	i32 72, ; 121
	i32 55, ; 122
	i32 46, ; 123
	i32 320, ; 124
	i32 184, ; 125
	i32 237, ; 126
	i32 22, ; 127
	i32 251, ; 128
	i32 206, ; 129
	i32 86, ; 130
	i32 43, ; 131
	i32 160, ; 132
	i32 71, ; 133
	i32 173, ; 134
	i32 264, ; 135
	i32 199, ; 136
	i32 329, ; 137
	i32 3, ; 138
	i32 42, ; 139
	i32 63, ; 140
	i32 16, ; 141
	i32 53, ; 142
	i32 323, ; 143
	i32 287, ; 144
	i32 194, ; 145
	i32 105, ; 146
	i32 200, ; 147
	i32 292, ; 148
	i32 285, ; 149
	i32 248, ; 150
	i32 34, ; 151
	i32 158, ; 152
	i32 85, ; 153
	i32 32, ; 154
	i32 12, ; 155
	i32 51, ; 156
	i32 56, ; 157
	i32 268, ; 158
	i32 36, ; 159
	i32 180, ; 160
	i32 298, ; 161
	i32 286, ; 162
	i32 221, ; 163
	i32 35, ; 164
	i32 58, ; 165
	i32 255, ; 166
	i32 208, ; 167
	i32 203, ; 168
	i32 175, ; 169
	i32 17, ; 170
	i32 289, ; 171
	i32 164, ; 172
	i32 311, ; 173
	i32 254, ; 174
	i32 183, ; 175
	i32 281, ; 176
	i32 317, ; 177
	i32 153, ; 178
	i32 277, ; 179
	i32 262, ; 180
	i32 195, ; 181
	i32 315, ; 182
	i32 223, ; 183
	i32 204, ; 184
	i32 29, ; 185
	i32 52, ; 186
	i32 313, ; 187
	i32 282, ; 188
	i32 5, ; 189
	i32 297, ; 190
	i32 272, ; 191
	i32 276, ; 192
	i32 228, ; 193
	i32 293, ; 194
	i32 220, ; 195
	i32 239, ; 196
	i32 85, ; 197
	i32 281, ; 198
	i32 61, ; 199
	i32 112, ; 200
	i32 57, ; 201
	i32 327, ; 202
	i32 268, ; 203
	i32 99, ; 204
	i32 19, ; 205
	i32 232, ; 206
	i32 111, ; 207
	i32 101, ; 208
	i32 102, ; 209
	i32 295, ; 210
	i32 104, ; 211
	i32 285, ; 212
	i32 71, ; 213
	i32 196, ; 214
	i32 38, ; 215
	i32 32, ; 216
	i32 103, ; 217
	i32 73, ; 218
	i32 301, ; 219
	i32 9, ; 220
	i32 123, ; 221
	i32 46, ; 222
	i32 222, ; 223
	i32 185, ; 224
	i32 194, ; 225
	i32 9, ; 226
	i32 43, ; 227
	i32 4, ; 228
	i32 269, ; 229
	i32 305, ; 230
	i32 300, ; 231
	i32 330, ; 232
	i32 31, ; 233
	i32 138, ; 234
	i32 92, ; 235
	i32 93, ; 236
	i32 320, ; 237
	i32 196, ; 238
	i32 49, ; 239
	i32 141, ; 240
	i32 112, ; 241
	i32 140, ; 242
	i32 238, ; 243
	i32 115, ; 244
	i32 286, ; 245
	i32 157, ; 246
	i32 76, ; 247
	i32 79, ; 248
	i32 258, ; 249
	i32 37, ; 250
	i32 280, ; 251
	i32 206, ; 252
	i32 242, ; 253
	i32 235, ; 254
	i32 64, ; 255
	i32 138, ; 256
	i32 15, ; 257
	i32 116, ; 258
	i32 274, ; 259
	i32 283, ; 260
	i32 230, ; 261
	i32 48, ; 262
	i32 70, ; 263
	i32 80, ; 264
	i32 126, ; 265
	i32 94, ; 266
	i32 121, ; 267
	i32 290, ; 268
	i32 26, ; 269
	i32 251, ; 270
	i32 97, ; 271
	i32 28, ; 272
	i32 193, ; 273
	i32 226, ; 274
	i32 318, ; 275
	i32 296, ; 276
	i32 149, ; 277
	i32 169, ; 278
	i32 4, ; 279
	i32 98, ; 280
	i32 33, ; 281
	i32 93, ; 282
	i32 273, ; 283
	i32 181, ; 284
	i32 21, ; 285
	i32 41, ; 286
	i32 170, ; 287
	i32 312, ; 288
	i32 244, ; 289
	i32 304, ; 290
	i32 258, ; 291
	i32 289, ; 292
	i32 283, ; 293
	i32 263, ; 294
	i32 2, ; 295
	i32 134, ; 296
	i32 111, ; 297
	i32 182, ; 298
	i32 324, ; 299
	i32 213, ; 300
	i32 321, ; 301
	i32 58, ; 302
	i32 95, ; 303
	i32 303, ; 304
	i32 39, ; 305
	i32 224, ; 306
	i32 25, ; 307
	i32 94, ; 308
	i32 89, ; 309
	i32 99, ; 310
	i32 10, ; 311
	i32 209, ; 312
	i32 87, ; 313
	i32 100, ; 314
	i32 270, ; 315
	i32 177, ; 316
	i32 290, ; 317
	i32 215, ; 318
	i32 300, ; 319
	i32 7, ; 320
	i32 255, ; 321
	i32 295, ; 322
	i32 212, ; 323
	i32 88, ; 324
	i32 250, ; 325
	i32 154, ; 326
	i32 299, ; 327
	i32 33, ; 328
	i32 116, ; 329
	i32 82, ; 330
	i32 210, ; 331
	i32 20, ; 332
	i32 11, ; 333
	i32 162, ; 334
	i32 3, ; 335
	i32 189, ; 336
	i32 307, ; 337
	i32 207, ; 338
	i32 209, ; 339
	i32 184, ; 340
	i32 182, ; 341
	i32 84, ; 342
	i32 294, ; 343
	i32 64, ; 344
	i32 309, ; 345
	i32 277, ; 346
	i32 143, ; 347
	i32 259, ; 348
	i32 157, ; 349
	i32 41, ; 350
	i32 203, ; 351
	i32 117, ; 352
	i32 178, ; 353
	i32 197, ; 354
	i32 214, ; 355
	i32 303, ; 356
	i32 192, ; 357
	i32 266, ; 358
	i32 197, ; 359
	i32 131, ; 360
	i32 75, ; 361
	i32 66, ; 362
	i32 313, ; 363
	i32 172, ; 364
	i32 218, ; 365
	i32 143, ; 366
	i32 106, ; 367
	i32 151, ; 368
	i32 173, ; 369
	i32 70, ; 370
	i32 156, ; 371
	i32 177, ; 372
	i32 121, ; 373
	i32 127, ; 374
	i32 308, ; 375
	i32 202, ; 376
	i32 152, ; 377
	i32 241, ; 378
	i32 141, ; 379
	i32 228, ; 380
	i32 305, ; 381
	i32 20, ; 382
	i32 14, ; 383
	i32 135, ; 384
	i32 75, ; 385
	i32 59, ; 386
	i32 231, ; 387
	i32 167, ; 388
	i32 198, ; 389
	i32 168, ; 390
	i32 187, ; 391
	i32 15, ; 392
	i32 74, ; 393
	i32 6, ; 394
	i32 23, ; 395
	i32 253, ; 396
	i32 201, ; 397
	i32 212, ; 398
	i32 91, ; 399
	i32 330, ; 400
	i32 192, ; 401
	i32 306, ; 402
	i32 1, ; 403
	i32 136, ; 404
	i32 254, ; 405
	i32 276, ; 406
	i32 134, ; 407
	i32 69, ; 408
	i32 146, ; 409
	i32 315, ; 410
	i32 294, ; 411
	i32 245, ; 412
	i32 183, ; 413
	i32 88, ; 414
	i32 96, ; 415
	i32 235, ; 416
	i32 240, ; 417
	i32 310, ; 418
	i32 31, ; 419
	i32 45, ; 420
	i32 249, ; 421
	i32 193, ; 422
	i32 214, ; 423
	i32 109, ; 424
	i32 158, ; 425
	i32 35, ; 426
	i32 22, ; 427
	i32 114, ; 428
	i32 57, ; 429
	i32 274, ; 430
	i32 144, ; 431
	i32 118, ; 432
	i32 120, ; 433
	i32 110, ; 434
	i32 216, ; 435
	i32 139, ; 436
	i32 222, ; 437
	i32 54, ; 438
	i32 211, ; 439
	i32 105, ; 440
	i32 316, ; 441
	i32 188, ; 442
	i32 189, ; 443
	i32 133, ; 444
	i32 288, ; 445
	i32 279, ; 446
	i32 267, ; 447
	i32 322, ; 448
	i32 245, ; 449
	i32 191, ; 450
	i32 159, ; 451
	i32 301, ; 452
	i32 232, ; 453
	i32 163, ; 454
	i32 132, ; 455
	i32 267, ; 456
	i32 161, ; 457
	i32 314, ; 458
	i32 256, ; 459
	i32 140, ; 460
	i32 279, ; 461
	i32 275, ; 462
	i32 169, ; 463
	i32 190, ; 464
	i32 202, ; 465
	i32 217, ; 466
	i32 284, ; 467
	i32 40, ; 468
	i32 243, ; 469
	i32 81, ; 470
	i32 56, ; 471
	i32 37, ; 472
	i32 97, ; 473
	i32 166, ; 474
	i32 172, ; 475
	i32 280, ; 476
	i32 82, ; 477
	i32 219, ; 478
	i32 98, ; 479
	i32 30, ; 480
	i32 159, ; 481
	i32 18, ; 482
	i32 127, ; 483
	i32 119, ; 484
	i32 239, ; 485
	i32 270, ; 486
	i32 252, ; 487
	i32 272, ; 488
	i32 165, ; 489
	i32 247, ; 490
	i32 331, ; 491
	i32 269, ; 492
	i32 260, ; 493
	i32 170, ; 494
	i32 16, ; 495
	i32 144, ; 496
	i32 307, ; 497
	i32 125, ; 498
	i32 118, ; 499
	i32 38, ; 500
	i32 115, ; 501
	i32 47, ; 502
	i32 142, ; 503
	i32 117, ; 504
	i32 34, ; 505
	i32 175, ; 506
	i32 95, ; 507
	i32 53, ; 508
	i32 261, ; 509
	i32 129, ; 510
	i32 153, ; 511
	i32 24, ; 512
	i32 161, ; 513
	i32 238, ; 514
	i32 148, ; 515
	i32 104, ; 516
	i32 205, ; 517
	i32 89, ; 518
	i32 329, ; 519
	i32 226, ; 520
	i32 60, ; 521
	i32 142, ; 522
	i32 100, ; 523
	i32 5, ; 524
	i32 13, ; 525
	i32 122, ; 526
	i32 135, ; 527
	i32 28, ; 528
	i32 302, ; 529
	i32 72, ; 530
	i32 236, ; 531
	i32 24, ; 532
	i32 224, ; 533
	i32 265, ; 534
	i32 262, ; 535
	i32 319, ; 536
	i32 137, ; 537
	i32 217, ; 538
	i32 233, ; 539
	i32 168, ; 540
	i32 266, ; 541
	i32 298, ; 542
	i32 101, ; 543
	i32 123, ; 544
	i32 237, ; 545
	i32 179, ; 546
	i32 163, ; 547
	i32 167, ; 548
	i32 240, ; 549
	i32 39, ; 550
	i32 186, ; 551
	i32 306, ; 552
	i32 17, ; 553
	i32 171, ; 554
	i32 319, ; 555
	i32 318, ; 556
	i32 137, ; 557
	i32 150, ; 558
	i32 229, ; 559
	i32 174, ; 560
	i32 155, ; 561
	i32 130, ; 562
	i32 195, ; 563
	i32 19, ; 564
	i32 65, ; 565
	i32 147, ; 566
	i32 47, ; 567
	i32 326, ; 568
	i32 215, ; 569
	i32 79, ; 570
	i32 61, ; 571
	i32 106, ; 572
	i32 264, ; 573
	i32 219, ; 574
	i32 49, ; 575
	i32 250, ; 576
	i32 323, ; 577
	i32 261, ; 578
	i32 14, ; 579
	i32 174, ; 580
	i32 178, ; 581
	i32 68, ; 582
	i32 171, ; 583
	i32 225, ; 584
	i32 229, ; 585
	i32 328, ; 586
	i32 78, ; 587
	i32 234, ; 588
	i32 199, ; 589
	i32 108, ; 590
	i32 218, ; 591
	i32 260, ; 592
	i32 67, ; 593
	i32 63, ; 594
	i32 27, ; 595
	i32 160, ; 596
	i32 227, ; 597
	i32 10, ; 598
	i32 186, ; 599
	i32 11, ; 600
	i32 205, ; 601
	i32 78, ; 602
	i32 126, ; 603
	i32 83, ; 604
	i32 180, ; 605
	i32 66, ; 606
	i32 107, ; 607
	i32 65, ; 608
	i32 128, ; 609
	i32 122, ; 610
	i32 77, ; 611
	i32 275, ; 612
	i32 265, ; 613
	i32 327, ; 614
	i32 8, ; 615
	i32 233, ; 616
	i32 2, ; 617
	i32 44, ; 618
	i32 278, ; 619
	i32 156, ; 620
	i32 128, ; 621
	i32 263, ; 622
	i32 23, ; 623
	i32 133, ; 624
	i32 221, ; 625
	i32 252, ; 626
	i32 322, ; 627
	i32 304, ; 628
	i32 29, ; 629
	i32 220, ; 630
	i32 62, ; 631
	i32 188, ; 632
	i32 90, ; 633
	i32 87, ; 634
	i32 148, ; 635
	i32 190, ; 636
	i32 36, ; 637
	i32 86, ; 638
	i32 241, ; 639
	i32 317, ; 640
	i32 312, ; 641
	i32 179, ; 642
	i32 50, ; 643
	i32 6, ; 644
	i32 90, ; 645
	i32 324, ; 646
	i32 21, ; 647
	i32 162, ; 648
	i32 96, ; 649
	i32 50, ; 650
	i32 113, ; 651
	i32 257, ; 652
	i32 130, ; 653
	i32 76, ; 654
	i32 27, ; 655
	i32 234, ; 656
	i32 256, ; 657
	i32 7, ; 658
	i32 0, ; 659
	i32 187, ; 660
	i32 110, ; 661
	i32 257, ; 662
	i32 243 ; 663
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ cdb777a0c306e3e0668f847433f82144d7ca745f"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
