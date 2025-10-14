Shader "RealShaderMaster/Basic/001colorChange"{ //渐变
    SubShader {
        Pass{
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag//指定顶点着色器和片元着色器
            #include "UnityCG.cginc"

            struct CC_v2f{
                float4 position:SV_POSITION;//SV_POSITION标记这是 屏幕空间顶点位置，必须给片元着色器使用。
                float2 uv:TEXCOORD0;
                };//小心这里有个分号

            CC_v2f  vert (appdata_base v){//appdata_base的定义在UnityCG中
                CC_v2f  o;
                o.position = UnityObjectToClipPos(v.vertex);//将顶点坐标从从模型空间变换到相机空间
                o.uv = v.texcoord;//获得模型UV坐标，存储备用
                return o;
            }

            float4 frag(CC_v2f i):SV_Target{
                float2 uv =i.uv;
                return float4(uv,0,1);// 我们让该点的颜色和其UV位置有关
            }

            ENDCG
        }
    }
}
