; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [363 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [720 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 20765420, ; 3: Tensorflow.Binding.dll => 0x13cdaec => 239
	i32 26230656, ; 4: Microsoft.Extensions.DependencyModel => 0x1903f80 => 198
	i32 32687329, ; 5: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 281
	i32 34715100, ; 6: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 315
	i32 34839235, ; 7: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 8: Newtonsoft.Json.dll => 0x254c520 => 223
	i32 39485524, ; 9: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 145
	i32 57754410, ; 11: Reddit.NET.dll => 0x371432a => 227
	i32 66541672, ; 12: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 13: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 356
	i32 68219467, ; 14: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 15: Microsoft.Maui.Graphics.dll => 0x44bb714 => 213
	i32 82292897, ; 16: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 98325684, ; 17: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 199
	i32 101534019, ; 18: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 299
	i32 117431740, ; 19: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 20: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 299
	i32 122350210, ; 21: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 123542112, ; 22: OneOf => 0x75d1a60 => 224
	i32 134690465, ; 23: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 319
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 255
	i32 176265551, ; 28: System.ServiceProcess => 0xa81994f => 132
	i32 176714968, ; 29: Microsoft.AspNetCore.WebUtilities.dll => 0xa8874d8 => 192
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 301
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 32: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 353
	i32 199333315, ; 33: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 354
	i32 205061960, ; 34: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 35: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 253
	i32 220171995, ; 36: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 37: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 275
	i32 230752869, ; 38: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 39: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 40: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 41: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 42: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 258
	i32 266296289, ; 43: MethodBoundaryAspect.dll => 0xfdf5be1 => 176
	i32 276479776, ; 44: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 45: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 277
	i32 280482487, ; 46: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 274
	i32 280992041, ; 47: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 325
	i32 291076382, ; 48: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 297949789, ; 49: MethodBoundaryAspect => 0x11c25a5d => 176
	i32 298918909, ; 50: System.Net.Ping.dll => 0x11d123fd => 69
	i32 300686228, ; 51: Microsoft.AspNetCore.Authentication.Abstractions.dll => 0x11ec1b94 => 177
	i32 305710573, ; 52: Microsoft.ML.CpuMath.dll => 0x1238c5ed => 220
	i32 313919069, ; 53: MemeOracleUI.dll => 0x12b6065d => 0
	i32 317674968, ; 54: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 353
	i32 318968648, ; 55: Xamarin.AndroidX.Activity.dll => 0x13031348 => 244
	i32 321597661, ; 56: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 57: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 338
	i32 342366114, ; 58: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 276
	i32 344827588, ; 59: Microsoft.AspNetCore.ResponseCaching.Abstractions => 0x148da6c4 => 189
	i32 347068432, ; 60: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 235
	i32 356389973, ; 61: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 337
	i32 360082299, ; 62: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 63: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 64: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 65: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 66: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 384051609, ; 67: Microsoft.AspNetCore.Routing.dll => 0x16e42999 => 190
	i32 385762202, ; 68: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 69: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 70: _Microsoft.Android.Resource.Designer => 0x17969339 => 359
	i32 398680804, ; 71: Serilog.Sinks.Console => 0x17c362e4 => 230
	i32 403441872, ; 72: WindowsBase => 0x180c08d0 => 165
	i32 413314040, ; 73: Sprache => 0x18a2abf8 => 231
	i32 435591531, ; 74: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 349
	i32 441335492, ; 75: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 259
	i32 442565967, ; 76: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 77: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 272
	i32 451504562, ; 78: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 79: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 80: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 81: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 82: System.dll => 0x1bff388e => 164
	i32 476646585, ; 83: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 274
	i32 486930444, ; 84: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 287
	i32 490002678, ; 85: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x1d34d8f6 => 182
	i32 498788369, ; 86: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 87: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 336
	i32 503918385, ; 88: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 330
	i32 513247710, ; 89: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 207
	i32 526420162, ; 90: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 91: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 319
	i32 530272170, ; 92: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 93: Microsoft.Extensions.Logging => 0x20216150 => 202
	i32 540030774, ; 94: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 95: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 96: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 97: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 98: Jsr305Binding => 0x213954e7 => 312
	i32 569601784, ; 99: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 310
	i32 577335427, ; 100: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 101: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 344
	i32 601371474, ; 102: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 103: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 104: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 622817381, ; 105: System.Numerics.Tensors => 0x251f7065 => 238
	i32 627609679, ; 106: Xamarin.AndroidX.CustomView => 0x2568904f => 264
	i32 627931235, ; 107: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 342
	i32 639843206, ; 108: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 270
	i32 643868501, ; 109: System.Net => 0x2660a755 => 81
	i32 662205335, ; 110: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 111: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 306
	i32 666292255, ; 112: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 251
	i32 672442732, ; 113: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 114: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 115: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 324
	i32 690569205, ; 116: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 117: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 321
	i32 693804605, ; 118: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 119: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 120: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 316
	i32 700358131, ; 121: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 122: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 339
	i32 709557578, ; 123: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 327
	i32 720511267, ; 124: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 320
	i32 722857257, ; 125: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 724146010, ; 126: Microsoft.AspNetCore.Authorization.Policy.dll => 0x2b29975a => 180
	i32 735137430, ; 127: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 748832960, ; 128: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 233
	i32 752232764, ; 129: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 130: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 241
	i32 759454413, ; 131: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 132: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 133: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 134: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 348
	i32 789151979, ; 135: Microsoft.Extensions.Options => 0x2f0980eb => 206
	i32 790371945, ; 136: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 265
	i32 804715423, ; 137: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 138: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 279
	i32 812630446, ; 139: Serilog => 0x306fc1ae => 229
	i32 823281589, ; 140: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 141: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 142: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 143: System.Net.Quic => 0x31b69d60 => 71
	i32 839436655, ; 144: DotNetEnv => 0x3208c96f => 173
	i32 843511501, ; 145: Xamarin.AndroidX.Print => 0x3246f6cd => 292
	i32 848419076, ; 146: Microsoft.ML.DataView => 0x3291d904 => 221
	i32 857381194, ; 147: MemeFinder => 0x331a994a => 357
	i32 873119928, ; 148: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 149: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 150: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 151: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 152: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 153: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 351
	i32 928116545, ; 154: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 315
	i32 933403136, ; 155: Microsoft.ML.KMeansClustering => 0x37a29a00 => 216
	i32 952186615, ; 156: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 157: Newtonsoft.Json => 0x38f24a24 => 223
	i32 956575887, ; 158: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 320
	i32 966729478, ; 159: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 313
	i32 967690846, ; 160: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 276
	i32 975236339, ; 161: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 162: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 163: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 164: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 165: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 166: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 167: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 168: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 296
	i32 1019214401, ; 169: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 170: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 197
	i32 1029334545, ; 171: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 326
	i32 1031528504, ; 172: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 314
	i32 1035644815, ; 173: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 249
	i32 1036536393, ; 174: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 175: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048992957, ; 176: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 199
	i32 1052210849, ; 177: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 283
	i32 1059849049, ; 178: Sprache.dll => 0x3f2c0359 => 231
	i32 1064460183, ; 179: Razorvine.Pickle.dll => 0x3f725f97 => 226
	i32 1067306892, ; 180: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 181: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 182: Xamarin.Kotlin.StdLib => 0x409e66d8 => 317
	i32 1098259244, ; 183: System => 0x41761b2c => 164
	i32 1099692271, ; 184: Microsoft.DotNet.PlatformAbstractions => 0x418bf8ef => 193
	i32 1110309514, ; 185: Microsoft.Extensions.Hosting.Abstractions => 0x422dfa8a => 201
	i32 1112354281, ; 186: Microsoft.AspNetCore.Authentication.Abstractions => 0x424d2de9 => 177
	i32 1118262833, ; 187: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 339
	i32 1121599056, ; 188: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 282
	i32 1127624469, ; 189: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 204
	i32 1149092582, ; 190: Xamarin.AndroidX.Window => 0x447dc2e6 => 309
	i32 1168523401, ; 191: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 345
	i32 1170634674, ; 192: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 193: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 200
	i32 1175144683, ; 194: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 305
	i32 1178241025, ; 195: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 290
	i32 1199680934, ; 196: Microsoft.ML.PCA.dll => 0x4781ada6 => 217
	i32 1203215381, ; 197: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 343
	i32 1204270330, ; 198: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 251
	i32 1205030129, ; 199: Reddit.NET => 0x47d34cf1 => 227
	i32 1208641965, ; 200: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 201: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1220193633, ; 202: Microsoft.Net.Http.Headers => 0x48baad61 => 222
	i32 1234928153, ; 203: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 341
	i32 1236289705, ; 204: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x49b048a9 => 182
	i32 1243150071, ; 205: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 310
	i32 1253011324, ; 206: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 207: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 325
	i32 1264511973, ; 208: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 300
	i32 1267360935, ; 209: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 304
	i32 1267908789, ; 210: Microsoft.AspNetCore.Routing => 0x4b92c0b5 => 190
	i32 1273260888, ; 211: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 256
	i32 1275534314, ; 212: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 321
	i32 1278448581, ; 213: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 248
	i32 1292207520, ; 214: SQLitePCLRaw.core.dll => 0x4d0585a0 => 234
	i32 1293217323, ; 215: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 267
	i32 1309188875, ; 216: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 217: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 309
	i32 1324164729, ; 218: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 219: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 220: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 221: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 355
	i32 1376866003, ; 222: Xamarin.AndroidX.SavedState => 0x52114ed3 => 296
	i32 1379779777, ; 223: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 224: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 225: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 260
	i32 1408764838, ; 226: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 227: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 228: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 229: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 323
	i32 1434145427, ; 230: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 231: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 313
	i32 1439761251, ; 232: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1445117038, ; 233: Microsoft.ML.StandardTrainers => 0x5622bc6e => 218
	i32 1452070440, ; 234: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 235: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 236: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 237: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 238: es\Microsoft.Maui.Controls.resources => 0x57152abe => 329
	i32 1461234159, ; 239: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 240: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 241: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 242: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 250
	i32 1470490898, ; 243: Microsoft.Extensions.Primitives => 0x57a5e912 => 207
	i32 1472315147, ; 244: Microsoft.ML.KMeansClustering.dll => 0x57c1bf0b => 216
	i32 1479771757, ; 245: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 246: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 247: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 248: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 297
	i32 1493001747, ; 249: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 333
	i32 1514721132, ; 250: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 328
	i32 1530007743, ; 251: MemeOracle_SharedLibrary => 0x5b3210bf => 358
	i32 1536373174, ; 252: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 253: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 254: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 255: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 256: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 348
	i32 1555438164, ; 257: Microsoft.ML.StandardTrainers.dll => 0x5cb61a54 => 218
	i32 1565862583, ; 258: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 259: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 260: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 261: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 262: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 266
	i32 1592978981, ; 263: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 264: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 314
	i32 1601112923, ; 265: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 266: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 267: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 268: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 286
	i32 1622358360, ; 269: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 270: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 308
	i32 1625558452, ; 271: Serilog.dll => 0x60e40db4 => 229
	i32 1635184631, ; 272: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 270
	i32 1636350590, ; 273: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 263
	i32 1639515021, ; 274: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 275: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 276: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 277: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 278: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 302
	i32 1658251792, ; 279: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 311
	i32 1670060433, ; 280: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 258
	i32 1675553242, ; 281: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 282: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 283: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 284: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 285: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 286: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 287: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 318
	i32 1701541528, ; 288: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 289: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 235
	i32 1720223769, ; 290: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 279
	i32 1726116996, ; 291: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 292: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1728929640, ; 293: Microsoft.ML.Data.dll => 0x670d5f68 => 215
	i32 1729485958, ; 294: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 254
	i32 1736233607, ; 295: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 346
	i32 1743415430, ; 296: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 324
	i32 1744735666, ; 297: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 298: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 299: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 300: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 301: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 302: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 303: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 301
	i32 1770582343, ; 304: Microsoft.Extensions.Logging.dll => 0x6988f147 => 202
	i32 1776026572, ; 305: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 306: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 307: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 308: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 340
	i32 1788241197, ; 309: Xamarin.AndroidX.Fragment => 0x6a96652d => 272
	i32 1793755602, ; 310: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 332
	i32 1808609942, ; 311: Xamarin.AndroidX.Loader => 0x6bcd3296 => 286
	i32 1813058853, ; 312: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 317
	i32 1813201214, ; 313: Xamarin.Google.Android.Material => 0x6c13413e => 311
	i32 1818569960, ; 314: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 291
	i32 1818787751, ; 315: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1819327070, ; 316: Microsoft.AspNetCore.Http.Features.dll => 0x6c70ba5e => 186
	i32 1824175904, ; 317: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 318: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 319: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 203
	i32 1842015223, ; 320: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 352
	i32 1847515442, ; 321: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 241
	i32 1853025655, ; 322: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 349
	i32 1858542181, ; 323: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 324: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 325: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 331
	i32 1879696579, ; 326: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 327: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 252
	i32 1888955245, ; 328: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 329: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1894524299, ; 330: Microsoft.DotNet.PlatformAbstractions.dll => 0x70ec258b => 193
	i32 1898237753, ; 331: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 332: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 333: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1927897671, ; 334: System.CodeDom.dll => 0x72e96247 => 237
	i32 1928288591, ; 335: Microsoft.AspNetCore.Http.Abstractions => 0x72ef594f => 184
	i32 1939592360, ; 336: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 337: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 338: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 298
	i32 1968388702, ; 339: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 194
	i32 1983156543, ; 340: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 318
	i32 1985761444, ; 341: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 243
	i32 2003115576, ; 342: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 328
	i32 2011961780, ; 343: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 344: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 283
	i32 2025202353, ; 345: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 323
	i32 2031763787, ; 346: Xamarin.Android.Glide => 0x791a414b => 240
	i32 2045470958, ; 347: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 348: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 278
	i32 2060060697, ; 349: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 350: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 327
	i32 2070888862, ; 351: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2075706075, ; 352: Microsoft.AspNetCore.Http.Abstractions.dll => 0x7bb8c2db => 184
	i32 2079903147, ; 353: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 354: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2094405699, ; 355: System.Numerics.Tensors.dll => 0x7cd61843 => 238
	i32 2103459038, ; 356: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 236
	i32 2127167465, ; 357: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 358: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 359: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 360: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 361: Microsoft.Maui => 0x80bd55ad => 211
	i32 2169148018, ; 362: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 335
	i32 2171397733, ; 363: Serilog.Sinks.Console.dll => 0x816ce665 => 230
	i32 2178612968, ; 364: System.CodeDom => 0x81dafee8 => 237
	i32 2181898931, ; 365: Microsoft.Extensions.Options.dll => 0x820d22b3 => 206
	i32 2182738860, ; 366: Microsoft.AspNetCore.Mvc.Core.dll => 0x8219f3ac => 188
	i32 2192057212, ; 367: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 203
	i32 2193016926, ; 368: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2197979891, ; 369: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 198
	i32 2201107256, ; 370: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 322
	i32 2201231467, ; 371: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 372: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 205
	i32 2207618523, ; 373: it\Microsoft.Maui.Controls.resources => 0x839595db => 337
	i32 2217644978, ; 374: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 305
	i32 2222056684, ; 375: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2242871324, ; 376: Microsoft.AspNetCore.Http.dll => 0x85af801c => 183
	i32 2244775296, ; 377: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 287
	i32 2252106437, ; 378: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 379: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2262067697, ; 380: Razorvine.Pickle => 0x86d469f1 => 226
	i32 2265110946, ; 381: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 382: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 195
	i32 2267693617, ; 383: Microsoft.ML.Transforms.dll => 0x872a4231 => 219
	i32 2267999099, ; 384: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 242
	i32 2270573516, ; 385: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 331
	i32 2276592402, ; 386: Microsoft.ML.Core => 0x87b20b12 => 214
	i32 2279755925, ; 387: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 294
	i32 2280430125, ; 388: Microsoft.ML.Transforms => 0x87ec9a2d => 219
	i32 2285293097, ; 389: Microsoft.AspNetCore.Mvc.Abstractions => 0x8836ce29 => 187
	i32 2293034957, ; 390: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 391: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 392: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 393: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 341
	i32 2305521784, ; 394: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 395: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 246
	i32 2320631194, ; 396: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2321784778, ; 397: Microsoft.AspNetCore.Mvc.Abstractions.dll => 0x8a639fca => 187
	i32 2340441535, ; 398: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 399: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2352699283, ; 400: DotNetEnv.dll => 0x8c3b5793 => 173
	i32 2353062107, ; 401: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 402: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 403: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 194
	i32 2378619854, ; 404: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 405: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 406: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 336
	i32 2396085415, ; 407: Protobuf.Text.dll => 0x8ed15ca7 => 225
	i32 2401565422, ; 408: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 409: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 269
	i32 2421380589, ; 410: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 411: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 256
	i32 2427813419, ; 412: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 333
	i32 2435356389, ; 413: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 414: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 415: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458592288, ; 416: Microsoft.AspNetCore.Authentication.Core => 0x928b2420 => 178
	i32 2458678730, ; 417: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 418: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465273461, ; 419: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 233
	i32 2465532216, ; 420: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 259
	i32 2471841756, ; 421: netstandard.dll => 0x93554fdc => 167
	i32 2473157462, ; 422: Microsoft.ML.CpuMath => 0x93696356 => 220
	i32 2475788418, ; 423: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 424: Microsoft.Maui.Controls => 0x93dba8a1 => 209
	i32 2483903535, ; 425: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 426: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 427: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 428: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 429: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 281
	i32 2511882562, ; 430: OneOf.dll => 0x95b84942 => 224
	i32 2522472828, ; 431: Xamarin.Android.Glide.dll => 0x9659e17c => 240
	i32 2537015816, ; 432: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 179
	i32 2538310050, ; 433: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2545100931, ; 434: MemeOracle_SharedLibrary.dll => 0x97b32883 => 358
	i32 2549538471, ; 435: Microsoft.ML.Core.dll => 0x97f6dea7 => 214
	i32 2550873716, ; 436: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 334
	i32 2562349572, ; 437: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 438: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 439: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 282
	i32 2581819634, ; 440: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 304
	i32 2585220780, ; 441: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 442: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 443: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 444: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 200
	i32 2593268061, ; 445: Microsoft.AspNetCore.Routing.Abstractions.dll => 0x9a92215d => 191
	i32 2593496499, ; 446: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 343
	i32 2594125473, ; 447: Microsoft.AspNetCore.Hosting.Abstractions => 0x9a9f36a1 => 181
	i32 2605712449, ; 448: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 322
	i32 2615233544, ; 449: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 273
	i32 2616218305, ; 450: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 204
	i32 2617129537, ; 451: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 452: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 453: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 263
	i32 2624644809, ; 454: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 268
	i32 2626831493, ; 455: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 338
	i32 2627185994, ; 456: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 457: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 458: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 277
	i32 2633959305, ; 459: Microsoft.AspNetCore.Http.Extensions.dll => 0x9cff0789 => 185
	i32 2643034788, ; 460: Microsoft.ML.Data => 0x9d8982a4 => 215
	i32 2663391936, ; 461: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 242
	i32 2663698177, ; 462: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 463: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 464: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 465: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 466: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 467: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 468: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 302
	i32 2715334215, ; 469: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 470: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 471: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 472: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 473: Xamarin.AndroidX.Activity => 0xa2e0939b => 244
	i32 2735172069, ; 474: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 475: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 179
	i32 2737747696, ; 476: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 250
	i32 2740948882, ; 477: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2743847202, ; 478: Tensorflow.Binding => 0xa38bc922 => 239
	i32 2748088231, ; 479: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 480: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 344
	i32 2758225723, ; 481: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 210
	i32 2764765095, ; 482: Microsoft.Maui.dll => 0xa4caf7a7 => 211
	i32 2765824710, ; 483: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 484: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 316
	i32 2778768386, ; 485: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 307
	i32 2779977773, ; 486: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 295
	i32 2785988530, ; 487: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 350
	i32 2788224221, ; 488: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 273
	i32 2801831435, ; 489: Microsoft.Maui.Graphics => 0xa7008e0b => 213
	i32 2803228030, ; 490: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 491: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 329
	i32 2810250172, ; 492: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 260
	i32 2819470561, ; 493: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 494: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 495: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 295
	i32 2824502124, ; 496: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 497: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 342
	i32 2838993487, ; 498: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 284
	i32 2849599387, ; 499: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2850549256, ; 500: Microsoft.AspNetCore.Http.Features => 0xa9e7ee08 => 186
	i32 2853208004, ; 501: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 307
	i32 2855708567, ; 502: Xamarin.AndroidX.Transition => 0xaa36a797 => 303
	i32 2861098320, ; 503: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 504: Microsoft.Maui.Essentials => 0xaa8a4878 => 212
	i32 2866471860, ; 505: Protobuf.Text => 0xaadae3b4 => 225
	i32 2870099610, ; 506: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 245
	i32 2875164099, ; 507: Jsr305Binding.dll => 0xab5f85c3 => 312
	i32 2875220617, ; 508: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 509: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 271
	i32 2887636118, ; 510: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 511: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 512: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 513: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 514: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 515: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 516: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 308
	i32 2919462931, ; 517: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 518: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 247
	i32 2936416060, ; 519: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 520: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 521: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 522: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 523: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 524: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978368250, ; 525: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0xb1864afa => 181
	i32 2978675010, ; 526: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 267
	i32 2987532451, ; 527: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 298
	i32 2996646946, ; 528: Microsoft.AspNetCore.Http => 0xb29d3422 => 183
	i32 2996846495, ; 529: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 280
	i32 3016983068, ; 530: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 300
	i32 3023353419, ; 531: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 532: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 275
	i32 3033331042, ; 533: Microsoft.AspNetCore.Authentication.Core.dll => 0xb4ccf562 => 178
	i32 3036999524, ; 534: Microsoft.AspNetCore.Http.Extensions => 0xb504ef64 => 185
	i32 3038032645, ; 535: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 359
	i32 3056245963, ; 536: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 297
	i32 3057625584, ; 537: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 288
	i32 3059408633, ; 538: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 539: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 540: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 541: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 335
	i32 3090735792, ; 542: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 543: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 544: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 545: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3113762169, ; 546: Microsoft.AspNetCore.Routing.Abstractions => 0xb9983d79 => 191
	i32 3121463068, ; 547: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 548: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 549: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 550: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 551: GoogleGson.dll => 0xbba64c02 => 175
	i32 3151576809, ; 552: Microsoft.AspNetCore.Mvc.Core => 0xbbd93ee9 => 188
	i32 3159123045, ; 553: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 554: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 555: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 289
	i32 3192346100, ; 556: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 557: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 558: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 559: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 560: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 266
	i32 3220365878, ; 561: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 562: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3228018376, ; 563: Microsoft.AspNetCore.ResponseCaching.Abstractions.dll => 0xc067a6c8 => 189
	i32 3249260365, ; 564: RestSharp.dll => 0xc1abc74d => 228
	i32 3251039220, ; 565: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3257797210, ; 566: MemeFinder.dll => 0xc22e0a5a => 357
	i32 3258312781, ; 567: Xamarin.AndroidX.CardView => 0xc235e84d => 254
	i32 3265493905, ; 568: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 569: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 570: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 571: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 572: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3286872994, ; 573: SQLite-net.dll => 0xc3e9b3a2 => 232
	i32 3290767353, ; 574: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 575: System.Text.Encoding => 0xc4a8494a => 135
	i32 3300764913, ; 576: Microsoft.AspNetCore.WebUtilities => 0xc4bdacf1 => 192
	i32 3303498502, ; 577: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 578: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 330
	i32 3316684772, ; 579: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 580: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 264
	i32 3317144872, ; 581: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 582: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 252
	i32 3345895724, ; 583: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 293
	i32 3346324047, ; 584: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 290
	i32 3357674450, ; 585: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 347
	i32 3358260929, ; 586: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 587: SQLitePCLRaw.core => 0xc849ca45 => 234
	i32 3362336904, ; 588: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 245
	i32 3362522851, ; 589: Xamarin.AndroidX.Core => 0xc86c06e3 => 261
	i32 3366347497, ; 590: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 591: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 294
	i32 3381016424, ; 592: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 326
	i32 3395150330, ; 593: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 594: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 595: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 265
	i32 3428513518, ; 596: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 196
	i32 3429136800, ; 597: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 598: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 599: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 268
	i32 3445260447, ; 600: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 601: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 208
	i32 3463511458, ; 602: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 334
	i32 3471940407, ; 603: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 604: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 605: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 347
	i32 3484440000, ; 606: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 346
	i32 3485117614, ; 607: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 608: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 609: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 257
	i32 3499097210, ; 610: Google.Protobuf.dll => 0xd08ffc7a => 174
	i32 3509114376, ; 611: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 612: System.Security.dll => 0xd1854eb4 => 130
	i32 3522696746, ; 613: Microsoft.ML.PCA => 0xd1f8162a => 217
	i32 3530912306, ; 614: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 615: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 616: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 617: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 618: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 354
	i32 3597029428, ; 619: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 243
	i32 3598340787, ; 620: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 621: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 622: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 623: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 292
	i32 3633644679, ; 624: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 247
	i32 3638274909, ; 625: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 626: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 278
	i32 3643446276, ; 627: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 351
	i32 3643854240, ; 628: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 289
	i32 3645089577, ; 629: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3645630983, ; 630: Google.Protobuf => 0xd94bea07 => 174
	i32 3657292374, ; 631: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 195
	i32 3660523487, ; 632: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 633: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 634: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 253
	i32 3684561358, ; 635: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 257
	i32 3697841164, ; 636: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 356
	i32 3700866549, ; 637: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 638: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 262
	i32 3711244101, ; 639: Microsoft.ML.DataView.dll => 0xdd351745 => 221
	i32 3716563718, ; 640: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 641: Xamarin.AndroidX.Annotation => 0xdda814c6 => 246
	i32 3724971120, ; 642: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 288
	i32 3732100267, ; 643: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 644: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 645: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 646: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3754567612, ; 647: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 236
	i32 3765508441, ; 648: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 205
	i32 3786282454, ; 649: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 255
	i32 3792276235, ; 650: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 651: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 208
	i32 3802395368, ; 652: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3816437471, ; 653: RestSharp => 0xe37a36df => 228
	i32 3819260425, ; 654: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 655: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 656: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 657: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 197
	i32 3844307129, ; 658: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 659: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 660: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 661: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 662: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3876362041, ; 663: SQLite-net => 0xe70c9739 => 232
	i32 3885497537, ; 664: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 665: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 303
	i32 3888767677, ; 666: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 293
	i32 3889960447, ; 667: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 355
	i32 3896106733, ; 668: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 669: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 261
	i32 3901907137, ; 670: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 671: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 672: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 306
	i32 3928044579, ; 673: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 674: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 675: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 291
	i32 3945713374, ; 676: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 677: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 678: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 249
	i32 3959773229, ; 679: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 280
	i32 3980434154, ; 680: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 350
	i32 3987592930, ; 681: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 332
	i32 4003436829, ; 682: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 683: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 248
	i32 4025784931, ; 684: System.Memory => 0xeff49a63 => 62
	i32 4044155772, ; 685: Microsoft.Net.Http.Headers.dll => 0xf10ceb7c => 222
	i32 4046471985, ; 686: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 210
	i32 4054681211, ; 687: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 688: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 689: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4078967171, ; 690: Microsoft.Extensions.Hosting.Abstractions.dll => 0xf3201983 => 201
	i32 4094352644, ; 691: Microsoft.Maui.Essentials.dll => 0xf40add04 => 212
	i32 4099507663, ; 692: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 693: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 694: Xamarin.AndroidX.Emoji2 => 0xf479582c => 269
	i32 4102112229, ; 695: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 345
	i32 4125707920, ; 696: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 340
	i32 4126470640, ; 697: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 196
	i32 4127667938, ; 698: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 699: System.AppContext => 0xf6318da0 => 6
	i32 4141580284, ; 700: Microsoft.AspNetCore.Authorization.Policy => 0xf6db7ffc => 180
	i32 4147896353, ; 701: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 702: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 352
	i32 4151237749, ; 703: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 704: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 705: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 706: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 707: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 708: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 285
	i32 4185676441, ; 709: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 710: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 711: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 712: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 262
	i32 4258378803, ; 713: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 284
	i32 4260525087, ; 714: System.Buffers => 0xfdf2741f => 7
	i32 4263348244, ; 715: MemeOracleUI => 0xfe1d8814 => 0
	i32 4271975918, ; 716: Microsoft.Maui.Controls.dll => 0xfea12dee => 209
	i32 4274976490, ; 717: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 718: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 285
	i32 4294763496 ; 719: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 271
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [720 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 239, ; 3
	i32 198, ; 4
	i32 281, ; 5
	i32 315, ; 6
	i32 48, ; 7
	i32 223, ; 8
	i32 80, ; 9
	i32 145, ; 10
	i32 227, ; 11
	i32 30, ; 12
	i32 356, ; 13
	i32 124, ; 14
	i32 213, ; 15
	i32 102, ; 16
	i32 199, ; 17
	i32 299, ; 18
	i32 107, ; 19
	i32 299, ; 20
	i32 139, ; 21
	i32 224, ; 22
	i32 319, ; 23
	i32 77, ; 24
	i32 124, ; 25
	i32 13, ; 26
	i32 255, ; 27
	i32 132, ; 28
	i32 192, ; 29
	i32 301, ; 30
	i32 151, ; 31
	i32 353, ; 32
	i32 354, ; 33
	i32 18, ; 34
	i32 253, ; 35
	i32 26, ; 36
	i32 275, ; 37
	i32 1, ; 38
	i32 59, ; 39
	i32 42, ; 40
	i32 91, ; 41
	i32 258, ; 42
	i32 176, ; 43
	i32 147, ; 44
	i32 277, ; 45
	i32 274, ; 46
	i32 325, ; 47
	i32 54, ; 48
	i32 176, ; 49
	i32 69, ; 50
	i32 177, ; 51
	i32 220, ; 52
	i32 0, ; 53
	i32 353, ; 54
	i32 244, ; 55
	i32 83, ; 56
	i32 338, ; 57
	i32 276, ; 58
	i32 189, ; 59
	i32 235, ; 60
	i32 337, ; 61
	i32 131, ; 62
	i32 55, ; 63
	i32 149, ; 64
	i32 74, ; 65
	i32 145, ; 66
	i32 190, ; 67
	i32 62, ; 68
	i32 146, ; 69
	i32 359, ; 70
	i32 230, ; 71
	i32 165, ; 72
	i32 231, ; 73
	i32 349, ; 74
	i32 259, ; 75
	i32 12, ; 76
	i32 272, ; 77
	i32 125, ; 78
	i32 152, ; 79
	i32 113, ; 80
	i32 166, ; 81
	i32 164, ; 82
	i32 274, ; 83
	i32 287, ; 84
	i32 182, ; 85
	i32 84, ; 86
	i32 336, ; 87
	i32 330, ; 88
	i32 207, ; 89
	i32 150, ; 90
	i32 319, ; 91
	i32 60, ; 92
	i32 202, ; 93
	i32 51, ; 94
	i32 103, ; 95
	i32 114, ; 96
	i32 40, ; 97
	i32 312, ; 98
	i32 310, ; 99
	i32 120, ; 100
	i32 344, ; 101
	i32 52, ; 102
	i32 44, ; 103
	i32 119, ; 104
	i32 238, ; 105
	i32 264, ; 106
	i32 342, ; 107
	i32 270, ; 108
	i32 81, ; 109
	i32 136, ; 110
	i32 306, ; 111
	i32 251, ; 112
	i32 8, ; 113
	i32 73, ; 114
	i32 324, ; 115
	i32 155, ; 116
	i32 321, ; 117
	i32 154, ; 118
	i32 92, ; 119
	i32 316, ; 120
	i32 45, ; 121
	i32 339, ; 122
	i32 327, ; 123
	i32 320, ; 124
	i32 109, ; 125
	i32 180, ; 126
	i32 129, ; 127
	i32 233, ; 128
	i32 25, ; 129
	i32 241, ; 130
	i32 72, ; 131
	i32 55, ; 132
	i32 46, ; 133
	i32 348, ; 134
	i32 206, ; 135
	i32 265, ; 136
	i32 22, ; 137
	i32 279, ; 138
	i32 229, ; 139
	i32 86, ; 140
	i32 43, ; 141
	i32 160, ; 142
	i32 71, ; 143
	i32 173, ; 144
	i32 292, ; 145
	i32 221, ; 146
	i32 357, ; 147
	i32 3, ; 148
	i32 42, ; 149
	i32 63, ; 150
	i32 16, ; 151
	i32 53, ; 152
	i32 351, ; 153
	i32 315, ; 154
	i32 216, ; 155
	i32 105, ; 156
	i32 223, ; 157
	i32 320, ; 158
	i32 313, ; 159
	i32 276, ; 160
	i32 34, ; 161
	i32 158, ; 162
	i32 85, ; 163
	i32 32, ; 164
	i32 12, ; 165
	i32 51, ; 166
	i32 56, ; 167
	i32 296, ; 168
	i32 36, ; 169
	i32 197, ; 170
	i32 326, ; 171
	i32 314, ; 172
	i32 249, ; 173
	i32 35, ; 174
	i32 58, ; 175
	i32 199, ; 176
	i32 283, ; 177
	i32 231, ; 178
	i32 226, ; 179
	i32 175, ; 180
	i32 17, ; 181
	i32 317, ; 182
	i32 164, ; 183
	i32 193, ; 184
	i32 201, ; 185
	i32 177, ; 186
	i32 339, ; 187
	i32 282, ; 188
	i32 204, ; 189
	i32 309, ; 190
	i32 345, ; 191
	i32 153, ; 192
	i32 200, ; 193
	i32 305, ; 194
	i32 290, ; 195
	i32 217, ; 196
	i32 343, ; 197
	i32 251, ; 198
	i32 227, ; 199
	i32 29, ; 200
	i32 52, ; 201
	i32 222, ; 202
	i32 341, ; 203
	i32 182, ; 204
	i32 310, ; 205
	i32 5, ; 206
	i32 325, ; 207
	i32 300, ; 208
	i32 304, ; 209
	i32 190, ; 210
	i32 256, ; 211
	i32 321, ; 212
	i32 248, ; 213
	i32 234, ; 214
	i32 267, ; 215
	i32 85, ; 216
	i32 309, ; 217
	i32 61, ; 218
	i32 112, ; 219
	i32 57, ; 220
	i32 355, ; 221
	i32 296, ; 222
	i32 99, ; 223
	i32 19, ; 224
	i32 260, ; 225
	i32 111, ; 226
	i32 101, ; 227
	i32 102, ; 228
	i32 323, ; 229
	i32 104, ; 230
	i32 313, ; 231
	i32 71, ; 232
	i32 218, ; 233
	i32 38, ; 234
	i32 32, ; 235
	i32 103, ; 236
	i32 73, ; 237
	i32 329, ; 238
	i32 9, ; 239
	i32 123, ; 240
	i32 46, ; 241
	i32 250, ; 242
	i32 207, ; 243
	i32 216, ; 244
	i32 9, ; 245
	i32 43, ; 246
	i32 4, ; 247
	i32 297, ; 248
	i32 333, ; 249
	i32 328, ; 250
	i32 358, ; 251
	i32 31, ; 252
	i32 138, ; 253
	i32 92, ; 254
	i32 93, ; 255
	i32 348, ; 256
	i32 218, ; 257
	i32 49, ; 258
	i32 141, ; 259
	i32 112, ; 260
	i32 140, ; 261
	i32 266, ; 262
	i32 115, ; 263
	i32 314, ; 264
	i32 157, ; 265
	i32 76, ; 266
	i32 79, ; 267
	i32 286, ; 268
	i32 37, ; 269
	i32 308, ; 270
	i32 229, ; 271
	i32 270, ; 272
	i32 263, ; 273
	i32 64, ; 274
	i32 138, ; 275
	i32 15, ; 276
	i32 116, ; 277
	i32 302, ; 278
	i32 311, ; 279
	i32 258, ; 280
	i32 48, ; 281
	i32 70, ; 282
	i32 80, ; 283
	i32 126, ; 284
	i32 94, ; 285
	i32 121, ; 286
	i32 318, ; 287
	i32 26, ; 288
	i32 235, ; 289
	i32 279, ; 290
	i32 97, ; 291
	i32 28, ; 292
	i32 215, ; 293
	i32 254, ; 294
	i32 346, ; 295
	i32 324, ; 296
	i32 149, ; 297
	i32 169, ; 298
	i32 4, ; 299
	i32 98, ; 300
	i32 33, ; 301
	i32 93, ; 302
	i32 301, ; 303
	i32 202, ; 304
	i32 21, ; 305
	i32 41, ; 306
	i32 170, ; 307
	i32 340, ; 308
	i32 272, ; 309
	i32 332, ; 310
	i32 286, ; 311
	i32 317, ; 312
	i32 311, ; 313
	i32 291, ; 314
	i32 2, ; 315
	i32 186, ; 316
	i32 134, ; 317
	i32 111, ; 318
	i32 203, ; 319
	i32 352, ; 320
	i32 241, ; 321
	i32 349, ; 322
	i32 58, ; 323
	i32 95, ; 324
	i32 331, ; 325
	i32 39, ; 326
	i32 252, ; 327
	i32 25, ; 328
	i32 94, ; 329
	i32 193, ; 330
	i32 89, ; 331
	i32 99, ; 332
	i32 10, ; 333
	i32 237, ; 334
	i32 184, ; 335
	i32 87, ; 336
	i32 100, ; 337
	i32 298, ; 338
	i32 194, ; 339
	i32 318, ; 340
	i32 243, ; 341
	i32 328, ; 342
	i32 7, ; 343
	i32 283, ; 344
	i32 323, ; 345
	i32 240, ; 346
	i32 88, ; 347
	i32 278, ; 348
	i32 154, ; 349
	i32 327, ; 350
	i32 33, ; 351
	i32 184, ; 352
	i32 116, ; 353
	i32 82, ; 354
	i32 238, ; 355
	i32 236, ; 356
	i32 20, ; 357
	i32 11, ; 358
	i32 162, ; 359
	i32 3, ; 360
	i32 211, ; 361
	i32 335, ; 362
	i32 230, ; 363
	i32 237, ; 364
	i32 206, ; 365
	i32 188, ; 366
	i32 203, ; 367
	i32 84, ; 368
	i32 198, ; 369
	i32 322, ; 370
	i32 64, ; 371
	i32 205, ; 372
	i32 337, ; 373
	i32 305, ; 374
	i32 143, ; 375
	i32 183, ; 376
	i32 287, ; 377
	i32 157, ; 378
	i32 41, ; 379
	i32 226, ; 380
	i32 117, ; 381
	i32 195, ; 382
	i32 219, ; 383
	i32 242, ; 384
	i32 331, ; 385
	i32 214, ; 386
	i32 294, ; 387
	i32 219, ; 388
	i32 187, ; 389
	i32 131, ; 390
	i32 75, ; 391
	i32 66, ; 392
	i32 341, ; 393
	i32 172, ; 394
	i32 246, ; 395
	i32 143, ; 396
	i32 187, ; 397
	i32 106, ; 398
	i32 151, ; 399
	i32 173, ; 400
	i32 70, ; 401
	i32 156, ; 402
	i32 194, ; 403
	i32 121, ; 404
	i32 127, ; 405
	i32 336, ; 406
	i32 225, ; 407
	i32 152, ; 408
	i32 269, ; 409
	i32 141, ; 410
	i32 256, ; 411
	i32 333, ; 412
	i32 20, ; 413
	i32 14, ; 414
	i32 135, ; 415
	i32 178, ; 416
	i32 75, ; 417
	i32 59, ; 418
	i32 233, ; 419
	i32 259, ; 420
	i32 167, ; 421
	i32 220, ; 422
	i32 168, ; 423
	i32 209, ; 424
	i32 15, ; 425
	i32 74, ; 426
	i32 6, ; 427
	i32 23, ; 428
	i32 281, ; 429
	i32 224, ; 430
	i32 240, ; 431
	i32 179, ; 432
	i32 91, ; 433
	i32 358, ; 434
	i32 214, ; 435
	i32 334, ; 436
	i32 1, ; 437
	i32 136, ; 438
	i32 282, ; 439
	i32 304, ; 440
	i32 134, ; 441
	i32 69, ; 442
	i32 146, ; 443
	i32 200, ; 444
	i32 191, ; 445
	i32 343, ; 446
	i32 181, ; 447
	i32 322, ; 448
	i32 273, ; 449
	i32 204, ; 450
	i32 88, ; 451
	i32 96, ; 452
	i32 263, ; 453
	i32 268, ; 454
	i32 338, ; 455
	i32 31, ; 456
	i32 45, ; 457
	i32 277, ; 458
	i32 185, ; 459
	i32 215, ; 460
	i32 242, ; 461
	i32 109, ; 462
	i32 158, ; 463
	i32 35, ; 464
	i32 22, ; 465
	i32 114, ; 466
	i32 57, ; 467
	i32 302, ; 468
	i32 144, ; 469
	i32 118, ; 470
	i32 120, ; 471
	i32 110, ; 472
	i32 244, ; 473
	i32 139, ; 474
	i32 179, ; 475
	i32 250, ; 476
	i32 54, ; 477
	i32 239, ; 478
	i32 105, ; 479
	i32 344, ; 480
	i32 210, ; 481
	i32 211, ; 482
	i32 133, ; 483
	i32 316, ; 484
	i32 307, ; 485
	i32 295, ; 486
	i32 350, ; 487
	i32 273, ; 488
	i32 213, ; 489
	i32 159, ; 490
	i32 329, ; 491
	i32 260, ; 492
	i32 163, ; 493
	i32 132, ; 494
	i32 295, ; 495
	i32 161, ; 496
	i32 342, ; 497
	i32 284, ; 498
	i32 140, ; 499
	i32 186, ; 500
	i32 307, ; 501
	i32 303, ; 502
	i32 169, ; 503
	i32 212, ; 504
	i32 225, ; 505
	i32 245, ; 506
	i32 312, ; 507
	i32 40, ; 508
	i32 271, ; 509
	i32 81, ; 510
	i32 56, ; 511
	i32 37, ; 512
	i32 97, ; 513
	i32 166, ; 514
	i32 172, ; 515
	i32 308, ; 516
	i32 82, ; 517
	i32 247, ; 518
	i32 98, ; 519
	i32 30, ; 520
	i32 159, ; 521
	i32 18, ; 522
	i32 127, ; 523
	i32 119, ; 524
	i32 181, ; 525
	i32 267, ; 526
	i32 298, ; 527
	i32 183, ; 528
	i32 280, ; 529
	i32 300, ; 530
	i32 165, ; 531
	i32 275, ; 532
	i32 178, ; 533
	i32 185, ; 534
	i32 359, ; 535
	i32 297, ; 536
	i32 288, ; 537
	i32 170, ; 538
	i32 16, ; 539
	i32 144, ; 540
	i32 335, ; 541
	i32 125, ; 542
	i32 118, ; 543
	i32 38, ; 544
	i32 115, ; 545
	i32 191, ; 546
	i32 47, ; 547
	i32 142, ; 548
	i32 117, ; 549
	i32 34, ; 550
	i32 175, ; 551
	i32 188, ; 552
	i32 95, ; 553
	i32 53, ; 554
	i32 289, ; 555
	i32 129, ; 556
	i32 153, ; 557
	i32 24, ; 558
	i32 161, ; 559
	i32 266, ; 560
	i32 148, ; 561
	i32 104, ; 562
	i32 189, ; 563
	i32 228, ; 564
	i32 89, ; 565
	i32 357, ; 566
	i32 254, ; 567
	i32 60, ; 568
	i32 142, ; 569
	i32 100, ; 570
	i32 5, ; 571
	i32 13, ; 572
	i32 232, ; 573
	i32 122, ; 574
	i32 135, ; 575
	i32 192, ; 576
	i32 28, ; 577
	i32 330, ; 578
	i32 72, ; 579
	i32 264, ; 580
	i32 24, ; 581
	i32 252, ; 582
	i32 293, ; 583
	i32 290, ; 584
	i32 347, ; 585
	i32 137, ; 586
	i32 234, ; 587
	i32 245, ; 588
	i32 261, ; 589
	i32 168, ; 590
	i32 294, ; 591
	i32 326, ; 592
	i32 101, ; 593
	i32 123, ; 594
	i32 265, ; 595
	i32 196, ; 596
	i32 163, ; 597
	i32 167, ; 598
	i32 268, ; 599
	i32 39, ; 600
	i32 208, ; 601
	i32 334, ; 602
	i32 17, ; 603
	i32 171, ; 604
	i32 347, ; 605
	i32 346, ; 606
	i32 137, ; 607
	i32 150, ; 608
	i32 257, ; 609
	i32 174, ; 610
	i32 155, ; 611
	i32 130, ; 612
	i32 217, ; 613
	i32 19, ; 614
	i32 65, ; 615
	i32 147, ; 616
	i32 47, ; 617
	i32 354, ; 618
	i32 243, ; 619
	i32 79, ; 620
	i32 61, ; 621
	i32 106, ; 622
	i32 292, ; 623
	i32 247, ; 624
	i32 49, ; 625
	i32 278, ; 626
	i32 351, ; 627
	i32 289, ; 628
	i32 14, ; 629
	i32 174, ; 630
	i32 195, ; 631
	i32 68, ; 632
	i32 171, ; 633
	i32 253, ; 634
	i32 257, ; 635
	i32 356, ; 636
	i32 78, ; 637
	i32 262, ; 638
	i32 221, ; 639
	i32 108, ; 640
	i32 246, ; 641
	i32 288, ; 642
	i32 67, ; 643
	i32 63, ; 644
	i32 27, ; 645
	i32 160, ; 646
	i32 236, ; 647
	i32 205, ; 648
	i32 255, ; 649
	i32 10, ; 650
	i32 208, ; 651
	i32 11, ; 652
	i32 228, ; 653
	i32 78, ; 654
	i32 126, ; 655
	i32 83, ; 656
	i32 197, ; 657
	i32 66, ; 658
	i32 107, ; 659
	i32 65, ; 660
	i32 128, ; 661
	i32 122, ; 662
	i32 232, ; 663
	i32 77, ; 664
	i32 303, ; 665
	i32 293, ; 666
	i32 355, ; 667
	i32 8, ; 668
	i32 261, ; 669
	i32 2, ; 670
	i32 44, ; 671
	i32 306, ; 672
	i32 156, ; 673
	i32 128, ; 674
	i32 291, ; 675
	i32 23, ; 676
	i32 133, ; 677
	i32 249, ; 678
	i32 280, ; 679
	i32 350, ; 680
	i32 332, ; 681
	i32 29, ; 682
	i32 248, ; 683
	i32 62, ; 684
	i32 222, ; 685
	i32 210, ; 686
	i32 90, ; 687
	i32 87, ; 688
	i32 148, ; 689
	i32 201, ; 690
	i32 212, ; 691
	i32 36, ; 692
	i32 86, ; 693
	i32 269, ; 694
	i32 345, ; 695
	i32 340, ; 696
	i32 196, ; 697
	i32 50, ; 698
	i32 6, ; 699
	i32 180, ; 700
	i32 90, ; 701
	i32 352, ; 702
	i32 21, ; 703
	i32 162, ; 704
	i32 96, ; 705
	i32 50, ; 706
	i32 113, ; 707
	i32 285, ; 708
	i32 130, ; 709
	i32 76, ; 710
	i32 27, ; 711
	i32 262, ; 712
	i32 284, ; 713
	i32 7, ; 714
	i32 0, ; 715
	i32 209, ; 716
	i32 110, ; 717
	i32 285, ; 718
	i32 271 ; 719
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
