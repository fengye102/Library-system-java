<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>注册 - 图书借阅管理系统</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth-animated.css">
</head>
<body class="auth-page">

<div id="register-page" class="page visible">
  <!-- ===== LEFT PANEL ===== -->
  <div class="left-panel">
    <div class="logo">
      <div class="logo-icon">📚</div>
      <span>图书借阅管理系统</span>
    </div>
    <div class="characters-wrapper">
      <div class="characters-scene" id="register-scene">
        <div class="character char-purple" id="r-char-purple">
          <div class="eyes" id="r-purple-eyes" style="left:45px;top:40px;gap:28px;">
            <div class="eyeball" id="r-purple-eye-l" style="width:18px;height:18px;">
              <div class="pupil" id="r-purple-pupil-l" style="width:7px;height:7px;"></div>
            </div>
            <div class="eyeball" id="r-purple-eye-r" style="width:18px;height:18px;">
              <div class="pupil" id="r-purple-pupil-r" style="width:7px;height:7px;"></div>
            </div>
          </div>
          <div class="happy-mouth" id="r-purple-happy" style="left:60px;top:75px;"></div>
        </div>
        <div class="character char-black" id="r-char-black">
          <div class="eyes" id="r-black-eyes" style="left:26px;top:32px;gap:20px;">
            <div class="eyeball" id="r-black-eye-l" style="width:16px;height:16px;">
              <div class="pupil" id="r-black-pupil-l" style="width:6px;height:6px;"></div>
            </div>
            <div class="eyeball" id="r-black-eye-r" style="width:16px;height:16px;">
              <div class="pupil" id="r-black-pupil-r" style="width:6px;height:6px;"></div>
            </div>
          </div>
        </div>
        <div class="character char-orange" id="r-char-orange">
          <div class="eyes" id="r-orange-eyes" style="left:82px;top:90px;gap:28px;">
            <div class="bare-pupil" id="r-orange-pupil-l"></div>
            <div class="bare-pupil" id="r-orange-pupil-r"></div>
          </div>
          <div class="orange-mouth" id="r-orange-mouth" style="left:90px;top:120px;"></div>
        </div>
        <div class="character char-yellow" id="r-char-yellow">
          <div class="eyes" id="r-yellow-eyes" style="left:52px;top:40px;gap:20px;">
            <div class="bare-pupil" id="r-yellow-pupil-l"></div>
            <div class="bare-pupil" id="r-yellow-pupil-r"></div>
          </div>
          <div class="yellow-mouth" id="r-yellow-mouth" style="left:40px;top:88px;"></div>
          <div class="happy-mouth" id="r-yellow-happy" style="left:42px;top:82px;"></div>
        </div>
      </div>
    </div>
    <div class="footer-links">
      <a href="#">武汉文理学院</a>
      <a href="#">图书馆</a>
    </div>
  </div>

  <!-- ===== RIGHT PANEL ===== -->
  <div class="right-panel">
    <div class="form-container">

      <!-- Steps indicator -->
      <div class="progress-bar-wrap" id="register-progress">
        <div class="progress-steps">
          <div class="step-dot active" id="step-dot-1"><span>1</span></div>
          <div class="step-line" id="step-line-1"></div>
          <div class="step-dot" id="step-dot-2"><span>2</span></div>
          <div class="step-line" id="step-line-2"></div>
          <div class="step-dot" id="step-dot-3"><span>3</span></div>
        </div>
        <div class="step-labels">
          <div class="step-label active" id="step-label-1">账号</div>
          <div class="step-label" id="step-label-2">信息</div>
          <div class="step-label" id="step-label-3">确认</div>
        </div>
      </div>

      <%-- 后端错误（用户名已存在等）--%>
      <c:if test="${not empty error}">
        <div class="auth-error-msg visible">${error}</div>
      </c:if>

      <div class="auth-error-msg" id="r-error-msg"></div>

      <!-- 真正的表单，包裹所有步骤字段，一次性提交 -->
      <form id="register-form" method="post" action="${pageContext.request.contextPath}/register">

        <!-- ====== STEP 1: 账号 ====== -->
        <div class="step-panel active" id="step-panel-1">
          <div class="form-header">
            <h1>创建账号</h1>
            <p>开始您的图书借阅之旅</p>
          </div>

          <div class="auth-form-group">
            <label id="r-username-label" for="r-username">用户名 <span style="color:#dc2626">*</span></label>
            <div class="input-wrapper">
              <input type="text" id="r-username" name="username" placeholder="4-20位字母或数字" autocomplete="off"/>
            </div>
          </div>

          <div class="auth-form-group">
            <label id="r-pwd-label" for="r-pwd">密码 <span style="color:#dc2626">*</span></label>
            <div class="input-wrapper">
              <input type="password" id="r-pwd" name="password" placeholder="请设置密码"/>
              <button type="button" class="toggle-password" id="r-toggle-pwd">
                <svg id="r-eye-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                  <circle cx="12" cy="12" r="3"></circle>
                </svg>
                <svg id="r-eye-off-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="display:none;">
                  <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                  <line x1="1" y1="1" x2="23" y2="23"></line>
                </svg>
              </button>
            </div>
            <div class="strength-bar-wrap" id="r-strength-wrap">
              <div class="strength-bar-track">
                <div class="strength-bar-fill" id="r-strength-fill"></div>
              </div>
              <span class="strength-label" id="r-strength-label">弱</span>
            </div>
            <div class="pwd-requirements" id="r-pwd-reqs">
              <div class="req-item" id="req-len">
                <div class="req-dot"></div><span>至少 6 个字符</span>
              </div>
              <div class="req-item" id="req-upper">
                <div class="req-dot"></div><span>包含大写字母</span>
              </div>
              <div class="req-item" id="req-num">
                <div class="req-dot"></div><span>包含数字</span>
              </div>
            </div>
          </div>

          <div class="auth-form-group">
            <label id="r-confirm-label" for="r-confirm">确认密码 <span style="color:#dc2626">*</span></label>
            <div class="input-wrapper">
              <input type="password" id="r-confirm" placeholder="再次输入密码"/>
            </div>
          </div>

          <button type="button" class="btn-auth-primary" id="r-btn-step1">
            <span class="btn-text">下一步</span>
            <div class="btn-hover-content">
              <span>继续</span>
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
            </div>
          </button>
        </div>

        <!-- ====== STEP 2: 个人信息 ====== -->
        <div class="step-panel" id="step-panel-2">
          <div class="form-header">
            <h1>个人信息</h1>
            <p>填写您的基本资料</p>
          </div>

          <div class="avatar-picker" id="avatar-picker">
            <div class="avatar-option selected" data-avatar="📚">📚</div>
            <div class="avatar-option" data-avatar="🎓">🎓</div>
            <div class="avatar-option" data-avatar="📖">📖</div>
            <div class="avatar-option" data-avatar="🔬">🔬</div>
            <div class="avatar-option" data-avatar="💻">💻</div>
            <div class="avatar-option" data-avatar="🌟">🌟</div>
          </div>

          <div class="auth-form-group">
            <label id="r-realname-label" for="r-realname">真实姓名 <span style="color:#dc2626">*</span></label>
            <div class="input-wrapper">
              <input type="text" id="r-realname" name="realname" placeholder="请输入真实姓名"/>
            </div>
          </div>

          <div class="form-row">
            <div class="auth-form-group">
              <label for="r-email">邮箱</label>
              <div class="input-wrapper">
                <input type="email" id="r-email" name="email" placeholder="选填"/>
              </div>
            </div>
            <div class="auth-form-group">
              <label for="r-phone">手机号</label>
              <div class="input-wrapper">
                <input type="text" id="r-phone" name="phone" placeholder="选填"/>
              </div>
            </div>
          </div>

          <div style="display:flex;gap:12px;">
            <button type="button" class="btn-auth-outline" id="r-btn-back1">← 返回</button>
            <button type="button" class="btn-auth-primary" id="r-btn-step2" style="margin-bottom:0;">
              <span class="btn-text">下一步</span>
              <div class="btn-hover-content">
                <span>继续</span>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
              </div>
            </button>
          </div>
        </div>

        <!-- ====== STEP 3: 确认 ====== -->
        <div class="step-panel" id="step-panel-3">
          <div class="form-header">
            <h1>确认信息</h1>
            <p>检查无误后提交注册</p>
          </div>

          <div id="summary-card" style="background:#f9f8ff;border:1.5px solid #ede9fe;border-radius:14px;padding:18px 20px;margin-bottom:20px;">
            <div style="display:flex;align-items:center;gap:14px;margin-bottom:14px;">
              <div id="summary-avatar" style="width:48px;height:48px;border-radius:50%;background:#ede9fe;display:flex;align-items:center;justify-content:center;font-size:24px;">📚</div>
              <div>
                <div id="summary-name"     style="font-weight:700;font-size:16px;color:#1a1a2e;">—</div>
                <div id="summary-username" style="font-size:12px;color:#888;">—</div>
              </div>
            </div>
            <div style="display:grid;grid-template-columns:1fr 1fr;gap:10px;">
              <div style="background:#fff;border-radius:8px;padding:10px 12px;">
                <div style="font-size:10px;color:#aaa;font-weight:600;letter-spacing:0.5px;margin-bottom:2px;">邮箱</div>
                <div id="summary-email" style="font-size:13px;color:#333;font-weight:500;">—</div>
              </div>
              <div style="background:#fff;border-radius:8px;padding:10px 12px;">
                <div style="font-size:10px;color:#aaa;font-weight:600;letter-spacing:0.5px;margin-bottom:2px;">手机号</div>
                <div id="summary-phone" style="font-size:13px;color:#333;font-weight:500;">—</div>
              </div>
            </div>
          </div>

          <label class="terms-check">
            <input type="checkbox" id="r-terms"/>
            我已阅读并同意 <a href="#">服务条款</a> 和 <a href="#">隐私政策</a>
          </label>

          <div style="display:flex;gap:12px;">
            <button type="button" class="btn-auth-outline" id="r-btn-back2">← 返回</button>
            <button type="submit" class="btn-auth-primary" id="r-btn-submit" style="margin-bottom:0;">
              <span class="btn-text">立即注册</span>
              <div class="btn-hover-content">
                <span>完成！</span>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
              </div>
            </button>
          </div>
        </div>

      </form><%-- /register-form --%>

      <!-- ====== SUCCESS ====== -->
      <div class="success-view" id="register-success">
        <div class="success-icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
            <polyline points="20 6 9 17 4 12"></polyline>
          </svg>
        </div>
        <h2>注册成功！🎉</h2>
        <p>欢迎加入图书借阅管理系统，<br><span class="email-highlight" id="success-name">同学</span>！<br>即将跳转到登录页面…</p>
      </div>

      <div class="nav-link" id="r-nav-link">
        已有账号？<a href="${pageContext.request.contextPath}/login">立即登录</a>
      </div>
    </div>
  </div>
</div>

<script>
// ============================================================
// REGISTER CHARACTER SYSTEM
// ============================================================
let rMX = 0, rMY = 0;
let rIsTyping = false, rIsLookingAtEachOther = false;
let rIsPurpleBlinking = false, rIsBlackBlinking = false;
let rIsPwdFocused = false, rShowPwd = false;
let rIsError = false, rErrorTimer = null;
let rTypingTimer = null;
let rCurrentStep = 1;

const rPwd     = document.getElementById('r-pwd');
const rUsername = document.getElementById('r-username');
const rToggle  = document.getElementById('r-toggle-pwd');

rToggle.addEventListener('click', () => {
  rShowPwd = !rShowPwd;
  rPwd.type = rShowPwd ? 'text' : 'password';
  document.getElementById('r-eye-icon').style.display    = rShowPwd ? 'none'  : 'block';
  document.getElementById('r-eye-off-icon').style.display = rShowPwd ? 'block' : 'none';
  rUpdateChars();
});

[rUsername, document.getElementById('r-confirm'), document.getElementById('r-realname'),
 document.getElementById('r-email'), document.getElementById('r-phone')].forEach(inp => {
  if (!inp) return;
  inp.addEventListener('focus', () => rSetTyping(true));
  inp.addEventListener('blur',  () => rSetTyping(false));
  inp.addEventListener('input', rUpdateChars);
});

rPwd.addEventListener('focus', () => { rIsPwdFocused = true;  rUpdateChars(); });
rPwd.addEventListener('blur',  () => { rIsPwdFocused = false; rUpdateChars(); });
rPwd.addEventListener('input', () => { updateStrength(); rUpdateChars(); });

document.addEventListener('mousemove', e => {
  rMX = e.clientX; rMY = e.clientY;
  if (!rIsTyping && !rIsError) rUpdateChars();
});

function rSetTyping(v) {
  rIsTyping = v;
  if (v) {
    rIsLookingAtEachOther = true;
    clearTimeout(rTypingTimer);
    rTypingTimer = setTimeout(() => { rIsLookingAtEachOther = false; rUpdateChars(); }, 800);
  } else { rIsLookingAtEachOther = false; }
  rUpdateChars();
}

function rScheduleBlink(flagSetter, delay) {
  setTimeout(() => {
    flagSetter(true); rUpdateChars();
    setTimeout(() => { flagSetter(false); rUpdateChars(); rScheduleBlink(flagSetter, Math.random()*4000+3000); }, 150);
  }, delay);
}
rScheduleBlink(v => rIsPurpleBlinking = v, Math.random()*4000+3000);
rScheduleBlink(v => rIsBlackBlinking  = v, Math.random()*4000+3000);

function rCalcPos(el) {
  if (!el) return {faceX:0,faceY:0,bodySkew:0};
  const r = el.getBoundingClientRect();
  const cx = r.left + r.width/2, cy = r.top + r.height/3;
  const dx = rMX - cx, dy = rMY - cy;
  return {
    faceX:    Math.max(-15, Math.min(15, dx/20)),
    faceY:    Math.max(-10, Math.min(10, dy/30)),
    bodySkew: Math.max(-6,  Math.min(6,  -dx/120))
  };
}

function rCalcPupil(el, max) {
  if (!el) return {x:0,y:0};
  const r = el.getBoundingClientRect();
  const dx = rMX-(r.left+r.width/2), dy = rMY-(r.top+r.height/2);
  const d = Math.min(Math.sqrt(dx*dx+dy*dy), max), a = Math.atan2(dy,dx);
  return {x: Math.cos(a)*d, y: Math.sin(a)*d};
}

function rUpdateChars() {
  const purple = document.getElementById('r-char-purple');
  const black  = document.getElementById('r-char-black');
  const orange = document.getElementById('r-char-orange');
  const yellow = document.getElementById('r-char-yellow');
  if (!purple) return;

  const pp = rCalcPos(purple), bp = rCalcPos(black);
  const op = rCalcPos(orange), yp = rCalcPos(yellow);
  const isShowPwd  = rPwd.value.length > 0 && rShowPwd;
  const isLookAway = rIsPwdFocused && !rShowPwd;

  // Purple body
  if (isShowPwd)      { purple.style.transform='skewX(0deg)'; purple.style.height='370px'; }
  else if (isLookAway){ purple.style.transform='skewX(-14deg) translateX(-20px)'; purple.style.height='410px'; }
  else if (rIsTyping) { purple.style.transform=`skewX(\${(pp.bodySkew||0)-12}deg) translateX(40px)`; purple.style.height='410px'; }
  else                { purple.style.transform=`skewX(\${pp.bodySkew}deg)`; purple.style.height='370px'; }

  const pEyes = document.getElementById('r-purple-eyes');
  const pEyeL = document.getElementById('r-purple-eye-l'), pEyeR = document.getElementById('r-purple-eye-r');
  const pPupL = document.getElementById('r-purple-pupil-l'), pPupR = document.getElementById('r-purple-pupil-r');
  pEyeL.style.height = rIsPurpleBlinking ? '2px' : '18px';
  pEyeR.style.height = rIsPurpleBlinking ? '2px' : '18px';

  if (rIsError) {
    pEyes.style.left='30px'; pEyes.style.top='55px';
    pPupL.style.transform='translate(-3px,4px)'; pPupR.style.transform='translate(-3px,4px)';
  } else if (isLookAway) {
    pEyes.style.left='20px'; pEyes.style.top='25px';
    pPupL.style.transform='translate(-5px,-5px)'; pPupR.style.transform='translate(-5px,-5px)';
  } else if (isShowPwd) {
    pEyes.style.left='20px'; pEyes.style.top='35px';
    pPupL.style.transform='translate(-4px,5px)'; pPupR.style.transform='translate(-4px,5px)';
  } else if (rIsLookingAtEachOther) {
    pEyes.style.left='55px'; pEyes.style.top='65px';
    pPupL.style.transform='translate(3px,4px)'; pPupR.style.transform='translate(3px,4px)';
  } else {
    pEyes.style.left=(45+pp.faceX)+'px'; pEyes.style.top=(40+pp.faceY)+'px';
    const po = rCalcPupil(pEyeL, 5);
    pPupL.style.transform=`translate(\${po.x}px,\${po.y}px)`; pPupR.style.transform=`translate(\${po.x}px,\${po.y}px)`;
  }

  // Black
  if (isShowPwd)              black.style.transform='skewX(0deg)';
  else if (isLookAway)        black.style.transform='skewX(12deg) translateX(-10px)';
  else if (rIsLookingAtEachOther) black.style.transform=`skewX(\${(bp.bodySkew||0)*1.5+10}deg) translateX(20px)`;
  else                        black.style.transform=`skewX(\${bp.bodySkew}deg)`;

  const bEyes = document.getElementById('r-black-eyes');
  const bEyeL = document.getElementById('r-black-eye-l'), bEyeR = document.getElementById('r-black-eye-r');
  const bPupL = document.getElementById('r-black-pupil-l'), bPupR = document.getElementById('r-black-pupil-r');
  bEyeL.style.height = rIsBlackBlinking ? '2px' : '16px';
  bEyeR.style.height = rIsBlackBlinking ? '2px' : '16px';

  if (rIsError) {
    bEyes.style.left='15px'; bEyes.style.top='40px';
    bPupL.style.transform='translate(-3px,4px)'; bPupR.style.transform='translate(-3px,4px)';
  } else if (isLookAway) {
    bEyes.style.left='10px'; bEyes.style.top='20px';
    bPupL.style.transform='translate(-4px,-5px)'; bPupR.style.transform='translate(-4px,-5px)';
  } else if (isShowPwd) {
    bEyes.style.left='10px'; bEyes.style.top='28px';
    bPupL.style.transform='translate(-4px,-4px)'; bPupR.style.transform='translate(-4px,-4px)';
  } else if (rIsLookingAtEachOther) {
    bEyes.style.left='32px'; bEyes.style.top='12px';
    bPupL.style.transform='translate(0,-4px)'; bPupR.style.transform='translate(0,-4px)';
  } else {
    bEyes.style.left=(26+bp.faceX)+'px'; bEyes.style.top=(32+bp.faceY)+'px';
    const bo = rCalcPupil(bEyeL, 4);
    bPupL.style.transform=`translate(\${bo.x}px,\${bo.y}px)`; bPupR.style.transform=`translate(\${bo.x}px,\${bo.y}px)`;
  }

  // Orange
  if (isShowPwd) orange.style.transform='skewX(0deg)';
  else           orange.style.transform=`skewX(\${op.bodySkew}deg)`;
  const oEyes = document.getElementById('r-orange-eyes');
  const oPupL = document.getElementById('r-orange-pupil-l'), oPupR = document.getElementById('r-orange-pupil-r');
  if (rIsError) {
    oEyes.style.left='60px'; oEyes.style.top='95px';
    oPupL.style.transform='translate(-3px,4px)'; oPupR.style.transform='translate(-3px,4px)';
  } else if (isLookAway||isShowPwd) {
    oEyes.style.left='50px'; oEyes.style.top='80px';
    oPupL.style.transform='translate(-5px,-5px)'; oPupR.style.transform='translate(-5px,-5px)';
  } else {
    oEyes.style.left=(82+op.faceX)+'px'; oEyes.style.top=(90+op.faceY)+'px';
    const oo = rCalcPupil(oPupL, 5);
    oPupL.style.transform=`translate(\${oo.x}px,\${oo.y}px)`; oPupR.style.transform=`translate(\${oo.x}px,\${oo.y}px)`;
  }

  // Yellow
  if (isShowPwd) yellow.style.transform='skewX(0deg)';
  else           yellow.style.transform=`skewX(\${yp.bodySkew}deg)`;
  const yEyes = document.getElementById('r-yellow-eyes');
  const yPupL = document.getElementById('r-yellow-pupil-l'), yPupR = document.getElementById('r-yellow-pupil-r');
  const yMouth = document.getElementById('r-yellow-mouth');
  if (rIsError) {
    yEyes.style.left='35px'; yEyes.style.top='45px';
    yPupL.style.transform='translate(-3px,4px)'; yPupR.style.transform='translate(-3px,4px)';
    yMouth.style.left='30px'; yMouth.style.top='92px'; yMouth.style.transform='rotate(-8deg)';
  } else if (isLookAway||isShowPwd) {
    yEyes.style.left='20px'; yEyes.style.top='30px';
    yPupL.style.transform='translate(-5px,-5px)'; yPupR.style.transform='translate(-5px,-5px)';
    yMouth.style.left='15px'; yMouth.style.top='78px'; yMouth.style.transform='rotate(0deg)';
  } else {
    yEyes.style.left=(52+yp.faceX)+'px'; yEyes.style.top=(40+yp.faceY)+'px';
    const yo = rCalcPupil(yPupL, 5);
    yPupL.style.transform=`translate(\${yo.x}px,\${yo.y}px)`; yPupR.style.transform=`translate(\${yo.x}px,\${yo.y}px)`;
    yMouth.style.left=(40+yp.faceX)+'px'; yMouth.style.top=(88+yp.faceY)+'px'; yMouth.style.transform='rotate(0deg)';
  }
}

function rTriggerError() {
  if (rErrorTimer) { clearTimeout(rErrorTimer); rErrorTimer = null; }
  const ids = ['r-purple-eyes','r-black-eyes','r-orange-eyes','r-yellow-eyes','r-yellow-mouth'];
  const els = ids.map(id => document.getElementById(id));
  els.forEach(el => el && el.classList.remove('shake-head'));
  void document.body.offsetHeight;
  rIsError = true; rUpdateChars();
  document.getElementById('r-orange-mouth').classList.add('visible');
  setTimeout(() => els.forEach(el => el && el.classList.add('shake-head')), 350);
  rErrorTimer = setTimeout(() => {
    rIsError = false; rErrorTimer = null;
    document.getElementById('r-orange-mouth').classList.remove('visible');
    els.forEach(el => el && el.classList.remove('shake-head'));
    rUpdateChars();
  }, 2500);
}

// ============================================================
// PASSWORD STRENGTH
// ============================================================
function updateStrength() {
  const val  = rPwd.value;
  const wrap  = document.getElementById('r-strength-wrap');
  const fill  = document.getElementById('r-strength-fill');
  const label = document.getElementById('r-strength-label');
  const reqs  = document.getElementById('r-pwd-reqs');
  if (!val) { wrap.classList.remove('visible'); reqs.classList.remove('visible'); return; }
  wrap.classList.add('visible'); reqs.classList.add('visible');

  const checks = { len: val.length >= 6, upper: /[A-Z]/.test(val), num: /[0-9]/.test(val) };
  const score  = Object.values(checks).filter(Boolean).length;

  document.getElementById('req-len').classList.toggle('met', checks.len);
  document.getElementById('req-upper').classList.toggle('met', checks.upper);
  document.getElementById('req-num').classList.toggle('met', checks.num);

  const levels = [
    { w:'33%',  bg:'#ef4444', text:'弱' },
    { w:'66%',  bg:'#f97316', text:'中' },
    { w:'100%', bg:'#22c55e', text:'强' }
  ];
  const lvl = levels[score - 1] || levels[0];
  fill.style.width = lvl.w; fill.style.background = lvl.bg;
  label.textContent = lvl.text; label.style.color = lvl.bg;
}

// ============================================================
// AVATAR PICKER
// ============================================================
let selectedAvatar = '📚';
document.getElementById('avatar-picker').addEventListener('click', e => {
  const opt = e.target.closest('.avatar-option');
  if (!opt) return;
  document.querySelectorAll('.avatar-option').forEach(o => o.classList.remove('selected'));
  opt.classList.add('selected');
  selectedAvatar = opt.dataset.avatar;
});

// ============================================================
// STEP NAVIGATION
// ============================================================
function goToStep(step) {
  document.querySelectorAll('.step-panel').forEach(p => p.classList.remove('active'));
  document.getElementById('step-panel-' + step).classList.add('active');
  rCurrentStep = step;
  for (let i = 1; i <= 3; i++) {
    const dot = document.getElementById('step-dot-' + i);
    const lbl = document.getElementById('step-label-' + i);
    dot.classList.remove('active','done');
    lbl.classList.remove('active','done');
    if (i < step)      { dot.classList.add('done');   lbl.classList.add('done'); }
    else if (i === step){ dot.classList.add('active'); lbl.classList.add('active'); }
  }
  for (let i = 1; i <= 2; i++) {
    document.getElementById('step-line-' + i).classList.toggle('done', i < step);
  }
  document.getElementById('r-error-msg').classList.remove('visible');
}

function showErr(msg) {
  const errEl = document.getElementById('r-error-msg');
  errEl.textContent = msg;
  errEl.classList.add('visible');
  rTriggerError();
}

// Step 1 → 2
document.getElementById('r-btn-step1').addEventListener('click', () => {
  const uname = rUsername.value.trim();
  const pwd   = rPwd.value;
  const conf  = document.getElementById('r-confirm').value;

  rUsername.classList.remove('error');
  rPwd.classList.remove('error');
  document.getElementById('r-confirm').classList.remove('error');
  document.getElementById('r-username-label').classList.remove('error-label');
  document.getElementById('r-pwd-label').classList.remove('error-label');
  document.getElementById('r-confirm-label').classList.remove('error-label');

  if (!uname) { rUsername.classList.add('error'); document.getElementById('r-username-label').classList.add('error-label'); showErr('请输入用户名'); return; }
  if (uname.length < 4) { rUsername.classList.add('error'); document.getElementById('r-username-label').classList.add('error-label'); showErr('用户名至少 4 个字符'); return; }
  if (pwd.length < 6)   { rPwd.classList.add('error'); document.getElementById('r-pwd-label').classList.add('error-label'); showErr('密码至少 6 个字符'); return; }
  if (pwd !== conf)     { document.getElementById('r-confirm').classList.add('error'); document.getElementById('r-confirm-label').classList.add('error-label'); showErr('两次密码不一致'); return; }

  goToStep(2); rUpdateChars();
});

// Step 2 → 3
document.getElementById('r-btn-step2').addEventListener('click', () => {
  const realname = document.getElementById('r-realname').value.trim();
  document.getElementById('r-realname').classList.remove('error');
  document.getElementById('r-realname-label').classList.remove('error-label');

  if (!realname) {
    document.getElementById('r-realname').classList.add('error');
    document.getElementById('r-realname-label').classList.add('error-label');
    showErr('请输入真实姓名'); return;
  }

  // Populate summary
  document.getElementById('summary-avatar').textContent    = selectedAvatar;
  document.getElementById('summary-name').textContent      = realname;
  document.getElementById('summary-username').textContent  = rUsername.value.trim();
  document.getElementById('summary-email').textContent     = document.getElementById('r-email').value.trim() || '—';
  document.getElementById('summary-phone').textContent     = document.getElementById('r-phone').value.trim() || '—';

  goToStep(3); rUpdateChars();
});

document.getElementById('r-btn-back1').addEventListener('click', () => { goToStep(1); rUpdateChars(); });
document.getElementById('r-btn-back2').addEventListener('click', () => { goToStep(2); rUpdateChars(); });

// Step 3 → submit (AJAX，提交后显示成功动画再跳转)
document.getElementById('register-form').addEventListener('submit', function(e) {
  e.preventDefault();
  if (!document.getElementById('r-terms').checked) {
    showErr('请先同意服务条款'); return;
  }
  const btn = document.getElementById('r-btn-submit');
  btn.querySelector('.btn-text').textContent = '注册中…';
  btn.disabled = true;

  const params = new URLSearchParams();
  new FormData(this).forEach((v, k) => params.append(k, v));
  fetch('${pageContext.request.contextPath}/register/ajax', {
    method: 'POST',
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: params.toString()
  })
  .then(r => r.json())
  .then(data => {
    if (data.success) {
      document.getElementById('register-progress').style.display = 'none';
      document.querySelectorAll('.step-panel').forEach(p => p.classList.remove('active'));
      document.getElementById('r-error-msg').classList.remove('visible');
      document.getElementById('r-nav-link').style.display = 'none';
      document.getElementById('success-name').textContent =
        document.getElementById('r-realname').value.trim() || '同学';
      document.getElementById('register-success').classList.add('visible');
      rTriggerSuccess();
      setTimeout(() => {
        window.location.href = '${pageContext.request.contextPath}/login?registered=1';
      }, 3000);
    } else {
      btn.querySelector('.btn-text').textContent = '立即注册';
      btn.disabled = false;
      showErr(data.error || '注册失败，请重试');
    }
  })
  .catch(() => {
    btn.querySelector('.btn-text').textContent = '立即注册';
    btn.disabled = false;
    showErr('网络错误，请重试');
  });
});

function rTriggerSuccess() {
  ['r-char-purple','r-char-black','r-char-orange','r-char-yellow'].forEach((id, i) => {
    const el = document.getElementById(id);
    if (!el) return;
    setTimeout(() => {
      el.classList.add('char-bounce');
      setTimeout(() => el.classList.remove('char-bounce'), 700);
    }, i * 120);
  });
  ['r-purple-happy','r-yellow-happy'].forEach(id => {
    const el = document.getElementById(id);
    if (el) el.classList.add('visible');
  });
  spawnConfetti();
}

function spawnConfetti() {
  const scene = document.getElementById('register-scene');
  if (!scene) return;
  const colors = ['#6C3FF5','#FF9B6B','#E8D754','#10b981','#3b82f6','#f43f5e'];
  for (let i = 0; i < 18; i++) {
    setTimeout(() => {
      const el = document.createElement('div');
      el.className = 'confetti-piece';
      el.style.cssText = 'left:' + (Math.random()*100) + '%;top:' + (Math.random()*40) + '%;background:' + colors[Math.floor(Math.random()*colors.length)] + ';animation-delay:' + (Math.random()*0.3) + 's;animation-duration:' + (0.8+Math.random()*0.6) + 's;transform:rotate(' + (Math.random()*360) + 'deg);border-radius:' + (Math.random()>0.5?'50%':'2px') + ';';
      scene.appendChild(el);
      setTimeout(() => el.remove(), 1500);
    }, i * 60);
  }
}

// 后端返回错误时触发摇头动画（页面重载到第1步）
(function() {
  const serverErr = document.querySelector('.auth-error-msg.visible');
  if (serverErr) { rTriggerError(); }
})();

rUpdateChars();
</script>
</body>
</html>
